import UIKit

class PidenBienMainScreenView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var greetings: UILabel!
    @IBOutlet weak var deliveryTitle: UILabel!
    @IBOutlet weak var deliveryDescription: UILabel!
    @IBOutlet weak var view1: XibDemo!
    @IBOutlet weak var view2: XibDemo!
    @IBOutlet weak var view3: XibDemo!
    @IBOutlet weak var hsv1Item1: ItemView!
    @IBOutlet weak var hsv1Item2: ItemView!
    @IBOutlet weak var hsv2Item1: ItemView!
    @IBOutlet weak var hsv2Item2: ItemView!
    @IBOutlet weak var hsv3Item1: ItemView!
    @IBOutlet weak var hsv3Item2: ItemView!
    @IBOutlet weak var hsv4Item1: ItemView!
    @IBOutlet weak var hsv4Item2: ItemView!
    @IBOutlet weak var cartButtonView: UIView!
    
    // MARK: - Life Cycle Methods
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
        view1.setInnerViewColor(colorHex: AppConstants.lightGreenColorHex)
        view2.setInnerViewColor(colorHex: AppConstants.boskiTypeColorHex)
        view3.setInnerViewColor(colorHex: AppConstants.lightGreenColorHex)
        hsv1Item1.setButtonWith(title: AppConstants.food)
        hsv1Item1.setBackgroundWith(image: AppConstants.food)
        hsv1Item2.setButtonWith(title: AppConstants.superMarket)
        hsv1Item2.setBackgroundWith(image: AppConstants.superMarket)
        hsv2Item1.setButtonWith(title: AppConstants.alcoholDelivery)
        hsv2Item1.setBackgroundWith(image: AppConstants.alcoholDelivery)
        hsv2Item2.setButtonWith(title: AppConstants.pets)
        hsv2Item2.setBackgroundWith(image: AppConstants.pets)
        hsv3Item1.setButtonWith(title: AppConstants.pharmacy)
        hsv3Item1.setBackgroundWith(image: AppConstants.pharmacy)
        hsv3Item2.setButtonWith(title: AppConstants.flowersAndGifts)
        hsv3Item2.setBackgroundWith(image: AppConstants.flowersAndGifts)
        hsv4Item1.setButtonWith(title: AppConstants.personalCare)
        hsv4Item1.setBackgroundWith(image: AppConstants.personalCare)
        hsv4Item2.setButtonWith(title: AppConstants.mall)
        hsv4Item2.setBackgroundWith(image: AppConstants.mall)
        cartButtonView.layer.cornerRadius = 24
    }
    
    private func customizeLabel(label: UILabel) {
        var mutableString = NSMutableAttributedString()
        let style = NSMutableParagraphStyle()
        mutableString = NSMutableAttributedString(string: deliveryDescription.text ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 12.0)!])
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: AppConstants.darkBlueColorHex), range: NSRange(location: 0,length: 4))
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: AppConstants.LightBrownColorHex), range: NSRange(location: 4, length: mutableString.length - 4))
        label.attributedText = mutableString
    }
    
}
