import UIKit

class OrderSummaryViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet var orderSummaryView: OrderSummaryView!
        
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        orderSummaryView.orderSummaryTable.register(OrderSummaryTableCell.nib(), forCellReuseIdentifier: OrderSummaryTableCell.reuseIdentifier)
    }
    
    // MARK: - Action Methods
    @IBAction
    func proceedPressed(_ sender: UIButton) {
        openCheckoutViewController()
    }
    
    // MARK: - Private Methods
    private func openCheckoutViewController() {
        let checkoutViewController = CheckoutViewController.instantiate(from: .main)
        navigationController?.pushViewController(checkoutViewController, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension OrderSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

// MARK: - UITableViewDataSource

extension OrderSummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderSummaryTableCell.reuseIdentifier, for: indexPath) as? OrderSummaryTableCell else { fatalError("xib doesn't exist") }
        return cell
    }
}

