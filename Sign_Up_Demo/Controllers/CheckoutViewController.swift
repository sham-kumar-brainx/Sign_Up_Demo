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
    func asapCheckBoxTapped(_ sender: UIGestureRecognizer) {
        checkoutView.asapCheckboxView.setCheckboxImage(LocalizedKey.filledCircle.string)
        checkoutView.scheduleCheckboxView.setCheckboxImage(LocalizedKey.emptyCircle.string)
        checkoutView.pickUpCheckboxView.setCheckboxImage(LocalizedKey.emptyCircle.string)
    }
    
    @objc
    func scheduleCheckboxViewTapped(_ sender: UIGestureRecognizer) {
        checkoutView.asapCheckboxView.setCheckboxImage(LocalizedKey.emptyCircle.string)
        checkoutView.scheduleCheckboxView.setCheckboxImage(LocalizedKey.filledCircle.string)
        checkoutView.pickUpCheckboxView.setCheckboxImage(LocalizedKey.emptyCircle.string)
    }
    
    @objc
    func pickUpCheckboxViewTapped(_ sender: UIGestureRecognizer) {
        checkoutView.asapCheckboxView.setCheckboxImage(LocalizedKey.emptyCircle.string)
        checkoutView.scheduleCheckboxView.setCheckboxImage(LocalizedKey.emptyCircle.string)
        checkoutView.pickUpCheckboxView.setCheckboxImage(LocalizedKey.filledCircle.string)
    }
    
    // MARK: - Private Methods
    private func configureOnLoad(){
        checkoutView.asapCheckboxView.addTapAction(#selector(asapCheckBoxTapped(_:)),target: self)
        checkoutView.scheduleCheckboxView.addTapAction(#selector(scheduleCheckboxViewTapped(_:)),target: self)
        checkoutView.pickUpCheckboxView.addTapAction(#selector(pickUpCheckboxViewTapped(_:)),target: self)
    }
}
