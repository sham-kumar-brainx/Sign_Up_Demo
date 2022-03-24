import Foundation
import UIKit

class XibDemo: UIView {
    
    // MARK: - Outlets
    @IBOutlet var innerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    // MARK: - Internal Properties
    let nibName = "XibDemo"
    
    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        innerView.layer.cornerRadius = 10
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
