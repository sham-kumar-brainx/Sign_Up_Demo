import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Internal Methods
    func setItemWith(title: String) {
        itemTitle.text = title
    }
    
    func setItemWith(image: String) {
        itemImage.image = UIImage(named: image)
    }
    
    // MARK: - Private Methods
    private func configure() {
        itemTitle.layer.masksToBounds = true
        itemTitle.layer.cornerRadius = 10
    }
}
