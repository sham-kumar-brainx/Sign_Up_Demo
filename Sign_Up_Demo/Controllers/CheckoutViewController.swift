import UIKit

class CheckoutViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var checkoutView: CheckoutView!
    
    // MARK: - Private Properties
    private var tipsButton = TipsButton.allCases

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnLoad()
    }
    
    // MARK: - Action Methods
    @IBAction
    func crossButtonTaped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func sideMenuActionTapped(_ sender: UIGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        setTappedButton(tipsButton[index])
    }
    
    // MARK: - Private Methods
    private func configureOnLoad(){
        checkoutView.zeroDollar.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        checkoutView.fiveDollar.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        checkoutView.tenDollar.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        checkoutView.otherDollar.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
    }
    
    // MARK: - Internal Methods
    func setTappedButton(_ tab: TipsButton) {
        switch tab {
        case .zeroDollar:
            checkoutView.zeroDollar.setSelected()
        case .fiveDollar:
            checkoutView.fiveDollar.setSelected()
        case .tenDollar:
            checkoutView.tenDollar.setSelected()
        case .otherDollar:
            checkoutView.otherDollar.setSelected()
        default:
            return
        }
    }
}
