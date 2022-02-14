import UIKit

class HorizentalCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var contentViewCell: XibDemo!
    
    // MARK: - Life Cycle Methods
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Internal Methods
    func setItemWith(title: String) {
        contentViewCell.setItemWith(title: title)
    }
    
    func setItemWith(subTitle: String) {
        contentViewCell.setItemWith(subTitle: subTitle)
    }

    func setItemWith(image: String) {
        contentViewCell.setItemWith(image: image)
    }
    
    func setInnerViewWith(colorHex: String) {
        contentViewCell.setInnerViewColor(colorHex: colorHex)
    }
}
