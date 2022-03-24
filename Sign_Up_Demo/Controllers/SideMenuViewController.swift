import UIKit

// MARK: - Protocol for SideMenuViewControllerDelegate
protocol SideMenuViewControllerDelegate {
    func openSelectedTab(_ tab: SideMenuTabs)
}

class SideMenuViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet var sideMenuView: SideMenuView!
    
    // MARK: - Private Properties
    private var sideMenuTabs = SideMenuTabs.allCases
    private var sideMenuData = SideMenuModel().sideMenuData
    
    // MARK: - Internal Properties
    var delegate: SideMenuViewControllerDelegate?
    var defaultSelectedTab: Int = 0

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnLoad()
        delegate?.openSelectedTab(sideMenuTabs[defaultSelectedTab])
    }
    
    // MARK: - Action Methods
    @IBAction
    func crossTaped(_ sender: UIButton) {
        revealViewController()?.revealSideMenu()
    }
    
    @objc
    func sideMenuActionTapped(_ sender: UIGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        delegate?.openSelectedTab(sideMenuTabs[index])
    }

    // MARK: - Private Methods
    private func configureOnLoad(){
        sideMenuView.homeTab.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        sideMenuView.myOrdersTab.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        sideMenuView.paymentTab.addTapAction(#selector(sideMenuActionTapped(_:)), target: self)
        sideMenuView.addressesTab.addTapAction(#selector(sideMenuActionTapped(_:)), target: self)
        sideMenuView.shopsTab.addTapAction(#selector(sideMenuActionTapped(_:)), target: self)
        sideMenuView.settingsTab.addTapAction(#selector(sideMenuActionTapped(_:)), target: self)
    }
}
