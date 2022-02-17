import UIKit

class VerticalCollectionCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    // MARK: - LifeCycle Methods
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
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func setImage(with title: String) {
        imageTitle.text = title
    }
    
    func setCellData(with model: VerticalScrollItemList) {
        imageView.image = UIImage(named: model.itemImage)
        imageTitle.text = model.title
    }
}
