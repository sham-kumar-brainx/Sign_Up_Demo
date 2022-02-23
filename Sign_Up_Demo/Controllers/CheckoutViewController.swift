import UIKit

class CheckoutViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var checkoutView: CheckoutView!
    
    // MARK: - Private Properties
    private var checkBoxes = CheckBoxes.allCases
    private var isControllSwitchSelected = false
    
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
    
    @IBAction
    func controlSwithTaped(_ sender: UIButton) {
        isControllSwitchSelected = !isControllSwitchSelected
        checkoutView.toggleControlSwitch(shouldSelect: isControllSwitchSelected)
    }
    
    @IBAction
    func tipsSegmentControlChanged(_ sender: Any) {
        
    }
    
    @objc
    func sideMenuActionTapped(_ sender: UIGestureRecognizer) {
        guard let index = sender.view?.tag else { return }
        setTappedButton(checkBoxes[index])
    }
    
    // MARK: - Private Methods
    private func configureOnLoad(){
        checkoutView.asapCheckboxView.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        checkoutView.scheduleCheckboxView.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
        checkoutView.pickUpCheckboxView.addTapAction(#selector(sideMenuActionTapped(_:)),target: self)
    }
    
    // MARK: - Internal Methods
    func setTappedButton(_ tab: CheckBoxes) {
//        switch tab {
//        case .asap:
//            <#code#>
//        case .schedule:
//            <#code#>
//        case .pickUP:
//            <#code#>
//        case .none:
//            <#code#>
//        }
    }
}
