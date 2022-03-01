import UIKit

class OrderSummaryTableCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var deleteItems: UIButton!
    @IBOutlet weak var removeOneItem: UIButton!
    @IBOutlet weak var addOneItem: UIButton!
}
