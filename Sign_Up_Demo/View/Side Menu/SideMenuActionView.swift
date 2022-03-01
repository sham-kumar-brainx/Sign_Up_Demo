import UIKit

class SideMenuActionView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var sideMenuView: UIView!
    
    // MARK: - private Properties
    private let nibName = "SideMenuActionView"
    
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
        configureView()
    }
    
    // MARK: - Lifecycle Methods
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Public Methods
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    // MARK: - Private Methods
    private func configureView() {
        sideMenuView.addBottomBorderWithColor(color: UIColor.hexStringToUIColor(hex: AppConstants.lineColorHex), borderWidth: 1, width: CGFloat(AppConstants.sideMenuWidth))
    }
}
