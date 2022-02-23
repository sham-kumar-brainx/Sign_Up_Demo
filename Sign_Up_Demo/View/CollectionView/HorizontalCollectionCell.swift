import Foundation
import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
        
    // MARK: - Private Methods
    private func configureView() {
        innerView.layer.cornerRadius = 10
    }
    
    // MARK: - Internal Methods
    func setInnerViewColor(with colorHex: String) {
        innerView.backgroundColor = UIColor.hexStringToUIColor(hex: colorHex)
    }
    
    func setItemTitle(with title: String) {
        self.title.text = title
    }
    
    func setItemSubtitle(with subTitle: String) {
        self.subTitle.text = subTitle
    }

    func setItemImage(with imageName: String) {
        itemImage.image = UIImage(named: imageName)
    }
    
    func setCellData(with model: HorizentalScrollItemList) {
        setInnerViewColor(with: model.innerViewColorHex)
        setItemTitle(with: model.title)
        setItemSubtitle(with: model.subTitle)
        setItemImage(with: model.itemImage)
    }
}
