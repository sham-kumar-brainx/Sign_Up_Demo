import UIKit

class OrderSummaryTableCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var deleteItems: UIButton!
    @IBOutlet weak var removeOneItem: UIButton!
    @IBOutlet weak var addOneItem: UIButton!

    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
       
    }

    // MARK: - Internal Methods
//    func setImage(with imageName: String) {
//        imageView.image = UIImage(named: imageName)
//    }
//
//    func setItemTitle(with title: String) {
//        imageTitle.text = title
//    }
//
//    func setCellData(with model: VerticalScrollItemList) {
//        setImage(with: model.itemImage)
//        setItemTitle(with: model.title)
//    }
}
