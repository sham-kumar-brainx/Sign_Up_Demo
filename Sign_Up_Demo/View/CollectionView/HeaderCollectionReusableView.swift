import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = LocalizedKey.orderingMessage.string
    }
}
