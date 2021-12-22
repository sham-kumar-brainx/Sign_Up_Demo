import UIKit
class SignUpView: UIView {
    // MARK: Outlets
    @IBOutlet weak var btnFbSignUp: UIButton!
    @IBOutlet weak var btnAppleSignUp: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txfFirstName: UITextField!
    @IBOutlet weak var txfLastName: UITextField!
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    @IBOutlet weak var txfPhone: UITextField!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var lblInstructions: UILabel!
    
    // MARK: Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        createSubviews()
    }
}
// MARK: Extention for SignUpView which extend its functionalites
extension SignUpView {
    // MARK: Private Methods
    private func createSubviews() {
        txfPhone.borderStyle = UITextField.BorderStyle.none
        phoneView.layer.borderWidth = 0.5
        phoneView.layer.borderColor = UIColor.hexStringToUIColor(hex: AppConstants.brownColorHex).cgColor
        phoneView.layer.cornerRadius = 4
        designButton(button: btnFbSignUp, backgroundColor: AppConstants.whiteColorHex, padding: 6.44, cornerRadius: 24, shadowColor: AppConstants.greyColorHex, opacity: 0.29, x: 0, y: 4, blur: 8)
        designButton(button: btnAppleSignUp, backgroundColor: AppConstants.whiteColorHex, padding: 6.44, cornerRadius: 24, shadowColor: AppConstants.greyColorHex, opacity: 0.29, x: 0, y: 4, blur: 8)
        designButton(button: btnSignUp, backgroundColor: AppConstants.orangeColorHex, cornerRadius: 4, shadowColor: AppConstants.darkGreyColorHex, opacity: 0.33, x: 0, y: 3, blur: 16)
        customizeLabel(label: lblInstructions)
    }
    private func designButton(
        button: UIButton,
        backgroundColor: String,
        padding: CGFloat = 0,
        cornerRadius: CGFloat = 0,
        shadowColor: String,
        opacity: Float = 1,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur:CGFloat = 0,
        spread: CGFloat = 0)
    {
        button.backgroundColor = UIColor.hexStringToUIColor(hex: backgroundColor)
        button.configuration?.imagePadding = padding
        button.layer.cornerRadius = cornerRadius
        let color: UIColor = UIColor.hexStringToUIColor(hex: shadowColor)
        button.layer.applySketchShadow(color: color, alpha: opacity, x: x, y: y, blur: blur, spread: spread)
    }
    private func customizeLabel(label: UILabel) {
        var mutableString = NSMutableAttributedString()
        let style = NSMutableParagraphStyle()
        mutableString = NSMutableAttributedString(string: lblInstructions.text ?? "", attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 12.0)!])
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: AppConstants.orangeColorHex), range: NSRange(location:110,length:14))
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: AppConstants.orangeColorHex), range: NSRange(location:85,length:20))
        style.lineSpacing = 10 // change line spacing between paragraph like 36 or 48
        style.alignment = .center
        mutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: label.text?.count ?? 0))
        label.attributedText = mutableString
    }
}
