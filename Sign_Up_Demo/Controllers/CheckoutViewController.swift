import UIKit

class CheckoutViewController: BaseViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    @IBAction
    func crossButtonTaped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
