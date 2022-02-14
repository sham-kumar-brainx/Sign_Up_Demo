import Foundation
import UIKit

class ItemViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    // MARK: - Variables
    let nibName = "ItemViewCell"
    
    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        addSubview(view)
        configureView()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Private Methods
    private func configureView(){
        imageLabel.layer.cornerRadius = 10
    }
    
    // MARK: - Internal Methods
    func setButtonWith(title: String) {
        imageLabel.text = title
    }
    
    func setBackgroundWith(image: String) {
        backgroundImage.image = UIImage(named: image)
    }
}
