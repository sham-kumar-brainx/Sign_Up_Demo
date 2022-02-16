import UIKit

class VerticalCollectionCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    // MARK: - Internal Properties
    var cornerRadius: CGFloat = 0 {
        didSet {
            if cornerRadius > 0 {
                imageView.viewCornerRadius = cornerRadius
                imageView.clipsToBounds = true
                imageView.layer.masksToBounds = true
            } else {
                imageView.viewCornerRadius = 0
            }
        }
    }
    
    // MARK: - Life Cycle Methods
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
}
