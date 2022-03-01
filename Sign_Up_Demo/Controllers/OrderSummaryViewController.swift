import UIKit

// MARK: - Protocol for SideMenuViewControllerDelegate
protocol OrderSummaryViewControllerDelegate {
    
    // MARK: - Internal Methods
    func openCheckoutViewController()
}

class OrderSummaryViewController: BaseViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    @IBOutlet var orderSummaryView: OrderSummaryView!
    
    // MARK: - Internal Properties
    var orderSummaryControllerDelegate: OrderSummaryViewControllerDelegate?
    
    // MARK: - Private Properties
    private var dummyData = Array(repeating: "X", count: 5)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        orderSummaryView.orderSummaryTable.register(OrderSummaryTableCell.nib(), forCellReuseIdentifier: OrderSummaryTableCell.reuseIdentifier)
        setTapGestureRecognizer()
    }
    
    // MARK: - Action Methods
    @IBAction
    func proceedPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        orderSummaryControllerDelegate?.openCheckoutViewController()
    }
    
    @objc
    private func TapGestureRecognizer(sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    // MARK: - Private Methods
    private func setTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizer))
        tapGestureRecognizer.delegate = self
        orderSummaryView.blurContentView.addGestureRecognizer(tapGestureRecognizer)
    }
}

// MARK: - Extension for confroming UITableViewDelegate, UITableViewDataSource
extension OrderSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Internal Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderSummaryTableCell.reuseIdentifier, for: indexPath) as? OrderSummaryTableCell else { fatalError(LocalizedKey.xibNotFoundError.string) }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            dummyData.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

