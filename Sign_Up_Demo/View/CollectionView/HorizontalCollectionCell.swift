import Foundation
import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
        
    // MARK: - Private Methods
    private func configureView() {
        innerView.layer.cornerRadius = 10
    }
    
    // MARK: - Internal Methods
    func setInnerViewColor(colorHex: String) {
        innerView.backgroundColor = UIColor.hexStringToUIColor(hex: colorHex)
    }
    
    func setItemWith(title: String) {
        self.title.text = title
    }
    
    func setItemWith(subTitle: String) {
        self.subTitle.text = subTitle
    }

    func setItemWith(image: String) {
        itemImage.image = UIImage(named: image)
    }
}
