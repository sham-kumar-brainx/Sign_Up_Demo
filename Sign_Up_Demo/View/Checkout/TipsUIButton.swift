import Foundation
import UIKit

class TipsUIButton: UIButton {

    // MARK: - Outlets
    @IBOutlet var title: UIButton!
    
    // MARK: - private Properties
    private let nibName = "TipsUIButton"
        
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
        title.layer.cornerRadius = 4
    }
    
    // MARK: - Lifecycle Methods
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Internal Methods
    func setTitle(_ title: String) {
        self.title.setTitle(title, for: .normal)
    }
    
    func setSelected() {
        title.setTitleColor(.white, for: .normal)
        title.backgroundColor = UIColor.hexStringToUIColor(hex: AppConstants.darkBlueColorHex)
    }
    
    func setData(title: String, isSelected: Bool) {
        setTitle(title)
        if isSelected {
            setSelected()
        }
    }
}
