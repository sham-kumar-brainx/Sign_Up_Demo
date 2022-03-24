import UIKit

class CustomCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Outlets
    @IBOutlet weak var orderingMessage: UILabel!

    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Internal Methods
    func setOrderingMessageWith(title: String) {
        orderingMessage.text = title
    }
}
