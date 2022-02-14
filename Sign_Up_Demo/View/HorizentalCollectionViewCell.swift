import UIKit

class HorizentalCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet var horizentalView: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subTitle: UILabel!
    @IBOutlet var innerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var contentViewCell: XibDemo!
    // MARK: - Life Cycle Methods
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Internal Methods
    func setItemWith(title: String) {
        self.title.text = title
    }
    
    func setItemWith(subTitle: String) {
        self.subTitle.text = subTitle
    }

    func setItemWith(image: String) {
        self.imageView.image = UIImage(named: image)
    }
    
    func setInnerViewWith(colorHex: String) {
//        innerView.backgroundColor = UIColor.hexStringToUIColor(hex: colorHex)
        contentViewCell.setInnerViewColor(colorHex: colorHex)
    }
}
