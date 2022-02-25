import UIKit

class OrderSummaryViewController: BaseViewController {
        
    // MARK: - Private Methods
    @IBAction
    func proceedPressed(_ sender: UIButton) {
        openCheckoutViewController()
    }
    
    private func openCheckoutViewController() {
        let checkoutViewController = CheckoutViewController.instantiate(from: .main)
        navigationController?.pushViewController(checkoutViewController, animated: true)
    }
}
