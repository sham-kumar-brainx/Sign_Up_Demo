import UIKit

class MainViewController: BaseViewController {
    
    // MARK: - Private Properties
    private var sideMenuViewController: SideMenuViewController!
    private var sideMenuShadowView: UIView!
    private var sideMenuRevealWidth: CGFloat = CGFloat(AppConstants.sideMenuWidth)
    private var isExpanded: Bool = false
    private var draggingIsEnabled: Bool = false
    private var panBaseLocation: CGFloat = 0.0
    private var sideMenuTrailingConstraint: NSLayoutConstraint!
    private var revealSideMenuOnTop: Bool = true
    private var gestureEnabled: Bool = true
    private var sideMenuTabs = SideMenuTabs.allCases
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
   
    // MARK: - Private Methods
    private func configureView() {
        setSideMenuShadowView()
        setTapGestureRecognizer()
        setPanGestureRecognizer()
        if revealSideMenuOnTop {
            view.insertSubview(sideMenuShadowView, at: 1)
        }
        setSideMenuViewController()
        if revealSideMenuOnTop {
            sideMenuTrailingConstraint = sideMenuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -sideMenuRevealWidth)
            sideMenuTrailingConstraint.isActive = true
        }
        NSLayoutConstraint.activate([
            sideMenuViewController.view.widthAnchor.constraint(equalToConstant: sideMenuRevealWidth),
            sideMenuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideMenuViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func setSideMenuShadowView() {
        sideMenuShadowView = UIView(frame: view.bounds)
        sideMenuShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sideMenuShadowView.backgroundColor = .black
        sideMenuShadowView.alpha = 0.0
    }
    
    private func setPanGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.delegate = self
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setSideMenuViewController() {
        sideMenuViewController = SideMenuViewController.instantiate(from: .main)
        sideMenuViewController.defaultSelectedTab = 0
        sideMenuViewController.delegate = self
        view.insertSubview(sideMenuViewController!.view, at: revealSideMenuOnTop ? 2 : 0)
        addChild(sideMenuViewController!)
        sideMenuViewController!.didMove(toParent: self)
        sideMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func animateShadow(targetPosition: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.sideMenuShadowView.alpha = (targetPosition == 0) ? 0.6 : 0.0
        }
    }
    
    private func sideMenuState(expanded: Bool) {
        if expanded {
            animateSideMenu(targetPosition: revealSideMenuOnTop ? 0 : sideMenuRevealWidth) { _ in
                self.isExpanded = true
            }
            UIView.animate(withDuration: 0.5) { self.sideMenuShadowView.alpha = 0.3 }
        }
        else {
            animateSideMenu(targetPosition: revealSideMenuOnTop ? (-sideMenuRevealWidth) : 0) { _ in
                self.isExpanded = false
            }
            UIView.animate(withDuration: 0.5) { self.sideMenuShadowView.alpha = 0.0 }
        }
    }
    
    private func animateSideMenu(targetPosition: CGFloat, completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .layoutSubviews, animations: {
            if self.revealSideMenuOnTop {
                self.sideMenuTrailingConstraint.constant = targetPosition
                self.view.layoutIfNeeded()
            }
            else {
                self.view.subviews[1].frame.origin.x = targetPosition
            }
        }, completion: completion)
    }

    private func showViewController<T: UIViewController>(viewController: T.Type) -> () {
        for subview in view.subviews {
            if subview.tag == 99 {
                subview.removeFromSuperview()
            }
        }
        let viewController = T.instantiate(from: .main)
        viewController.view.tag = 99
        view.insertSubview(viewController.view, at: revealSideMenuOnTop ? 0 : 1)
        addChild(viewController)
        if !revealSideMenuOnTop {
            if isExpanded {
                viewController.view.frame.origin.x = sideMenuRevealWidth
            }
            if sideMenuShadowView != nil {
                viewController.view.addSubview(sideMenuShadowView)
            }
        }
        viewController.didMove(toParent: self)
    }
    
    // MARK: - Action Methods
    @IBAction
    open func revealSideMenu() {
        sideMenuState(expanded: isExpanded ? false : true)
    }
    
    @objc
    private func TapGestureRecognizer(sender: UITapGestureRecognizer) {
        if sender.state == .ended && isExpanded {
            sideMenuState(expanded: false)
        }
    }
    
    @objc
    private func handlePanGesture(sender: UIPanGestureRecognizer) {
        guard gestureEnabled == true else { return }
        let position: CGFloat = sender.translation(in: view).x
        let velocity: CGFloat = sender.velocity(in: view).x
        switch sender.state {
        case .began:
            if velocity > 0, isExpanded {
                sender.state = .cancelled
            }
            if velocity > 0, !isExpanded {
                draggingIsEnabled = true
            }
            else if velocity < 0, isExpanded {
                draggingIsEnabled = true
            }
            if draggingIsEnabled {
                let velocityThreshold: CGFloat = 550
                if abs(velocity) > velocityThreshold {
                    sideMenuState(expanded: isExpanded ? false : true)
                    draggingIsEnabled = false
                    return
                }
                if revealSideMenuOnTop {
                    panBaseLocation = 0.0
                    if isExpanded {
                        panBaseLocation = sideMenuRevealWidth
                    }
                }
            }
        case .changed:
            if draggingIsEnabled {
                if revealSideMenuOnTop {
                    let xLocation: CGFloat = panBaseLocation + position
                    let percentage = (xLocation * 150 / sideMenuRevealWidth) / sideMenuRevealWidth
                    let alpha = percentage >= 0.6 ? 0.6 : percentage
                    sideMenuShadowView.alpha = alpha
                    if xLocation <= sideMenuRevealWidth {
                        sideMenuTrailingConstraint.constant = xLocation - sideMenuRevealWidth
                    }
                }
                else {
                    if let recogView = sender.view?.subviews[1] {
                        let percentage = (recogView.frame.origin.x * 150 / sideMenuRevealWidth) / sideMenuRevealWidth
                        let alpha = percentage >= 0.6 ? 0.6 : percentage
                        sideMenuShadowView.alpha = alpha
                        if recogView.frame.origin.x <= sideMenuRevealWidth, recogView.frame.origin.x >= 0 {
                            recogView.frame.origin.x = recogView.frame.origin.x + position
                            sender.setTranslation(CGPoint.zero, in: view)
                        }
                    }
                }
            }
        case .ended:
            draggingIsEnabled = false
            if revealSideMenuOnTop {
                let movedMoreThanHalf = sideMenuTrailingConstraint.constant > -(sideMenuRevealWidth * 0.5)
                sideMenuState(expanded: movedMoreThanHalf)
            }
            else {
                if let recogView = sender.view?.subviews[1] {
                    let movedMoreThanHalf = recogView.frame.origin.x > sideMenuRevealWidth * 0.5
                    sideMenuState(expanded: movedMoreThanHalf)
                }
            }
        default:
            break
        }
    }
}

// MARK: - Extention for confroming SideMenuViewControllerDelegate
extension MainViewController: SideMenuViewControllerDelegate {
    
    // MARK: - Internal Methods
    func openSelectedTab(_ tab: SideMenuTabs) {
        switch tab {
        case .home:
            showViewController(viewController: HomeViewController.self)
        case .myOrders:
            showViewController(viewController: MyOrdersViewController.self)
        case .payment:
            showViewController(viewController: PaymentViewController.self)
        case .addresses:
            print("Addresses Tab")
        case .shops:
            print("Shops Tab")
        case .settings:
            print("Settings Tab")
        default:
            return
        }
        DispatchQueue.main.async { self.sideMenuState(expanded: false) }
    }
}
