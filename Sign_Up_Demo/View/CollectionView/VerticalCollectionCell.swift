import UIKit

class VerticalCollectionCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        imageTitle.layer.masksToBounds = true
        imageTitle.layer.cornerRadius = 10
    }

    // MARK: - Internal Methods
    func setImage(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    func setItemTitle(with title: String) {
        imageTitle.text = title
    }
    
    func setCellData(with model: VerticalScrollItemList) {
        setImage(with: model.itemImage)
        setItemTitle(with: model.title)
    }
}
