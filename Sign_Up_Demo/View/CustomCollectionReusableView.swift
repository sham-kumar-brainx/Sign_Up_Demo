import UIKit

class CustomCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var orderingMessage: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // setup "lblTitle":
        orderingMessage.numberOfLines = 0
        orderingMessage.lineBreakMode = .byWordWrapping
        orderingMessage.sizeToFit()
    }
}
