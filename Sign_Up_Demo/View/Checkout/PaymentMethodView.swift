import Foundation
import UIKit

class PaymentMethodView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var heading: UILabel!
    
    // MARK: - private Properties
    private let nibName = "PaymentMethodView"
    
    // MARK: - Initializer Methods
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    // MARK: - Lifecycle Methods
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Internal Methods
    func setCheckboxImage(_ imageName: String) {
        checkBox.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func setHeading(_ heading: String) {
        self.heading.text = heading
    }
    
    func setData(heading: String, imageName: String) {
        setHeading(heading)
        setCheckboxImage(imageName)
    }
}
