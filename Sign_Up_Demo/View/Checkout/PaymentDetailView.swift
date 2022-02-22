import Foundation
import UIKit

class PaymentDetailView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var headingDescription: UILabel!
    
    // MARK: - private Properties
    private let nibName = "PaymentDetailView"
        
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
    func setHeading(_ heading: String) {
        self.heading.text = heading
    }
    
    func setHeadingDescription(_ headingDescription: String) {
        self.headingDescription.text = headingDescription
    }
    
    func setData(heading: String, headingDescription: String) {
        setHeading(heading)
        setHeadingDescription(headingDescription)
    }
}
