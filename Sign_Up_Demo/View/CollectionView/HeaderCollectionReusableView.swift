import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = LocalizedKey.orderingMessage.string
    }
}
