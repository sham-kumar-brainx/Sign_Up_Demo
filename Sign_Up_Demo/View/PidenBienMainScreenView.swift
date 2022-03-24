import UIKit

class PidenBienMainScreenView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var greetings: UILabel!
    @IBOutlet weak var deliveryTitle: UILabel!
    @IBOutlet weak var deliveryDescription: UILabel!
    @IBOutlet weak var cartButtonView: UIView!
    @IBOutlet weak var sideMenuLogo: UIButton!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        greetings.text = LocalizedKey.greetings.string
        deliveryTitle.text = LocalizedKey.deliveryTitle.string
        deliveryDescription.text = LocalizedKey.deliverDescription.string
        customizeLabel(label: deliveryDescription)
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 40
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        topView.layer.applySketchShadow(color: UIColor.hexStringToUIColor(hex: AppConstants.topViewShadowColorHex), alpha: 0.2, x: 0, y: 3, blur: 4)
        topView.backgroundColor = .white
        cartButtonView.layer.cornerRadius = 24
    }
    
    private func customizeLabel(label: UILabel) {
        var mutableString = NSMutableAttributedString()
        let style = NSMutableParagraphStyle()
        mutableString = NSMutableAttributedString(string: deliveryDescription.text ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 12.0)!])
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: AppConstants.darkBlueColorHex), range: NSRange(location: 0, length: 4))
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: AppConstants.LightBrownColorHex), range: NSRange(location: 4, length: mutableString.length - 4))
        label.attributedText = mutableString
    }
}
