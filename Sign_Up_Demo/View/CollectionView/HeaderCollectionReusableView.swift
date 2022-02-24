import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    // MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = LocalizedKey.orderingMessage.string
    }
}
