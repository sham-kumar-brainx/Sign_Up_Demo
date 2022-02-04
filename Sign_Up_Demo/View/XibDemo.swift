import Foundation
import UIKit

class XibDemo: UIView {
    
    // MARK: Outlets
    @IBOutlet var innerView: UIView!
    
    // MARK: - Variables
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
    
    func setInnerViewColor(colorHex: String){
        innerView.backgroundColor = UIColor.hexStringToUIColor(hex: colorHex)
    }
    
    // MARK: - Private Methods
    private func configureView(){
        innerView.layer.cornerRadius = 10
    }
}
