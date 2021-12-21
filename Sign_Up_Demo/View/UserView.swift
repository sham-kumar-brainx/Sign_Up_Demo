//
//  UserView1.swift
//  Sign_Up_Demo
//
//  Created by BrainX IOS on 21/12/2021.
//

import UIKit

class UserView: UIView {
    
    @IBOutlet weak var btnFbSignUp: UIButton!
    @IBOutlet weak var btnAppleSignUp: UIButton!
    
    
    @IBOutlet weak var txfFirstName: UITextField!
    @IBOutlet weak var txfLastName: UITextField!
    @IBOutlet weak var txfEmail: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    @IBOutlet weak var txfPhone: UITextField!
    
    
    @IBOutlet weak var phoneView: UIView!
    
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblInstructions: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createSubviews()
    }
}

extension UserView {
    func createSubviews() {
        
        txfPhone.borderStyle = UITextField.BorderStyle.none
        
        phoneView.layer.borderWidth = 0.5
        phoneView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#CCCCCC").cgColor
        phoneView.layer.cornerRadius = 4
        
        self.designButton(button: btnFbSignUp, backgroundColor: "#FFFFFF", padding: 6.44, cornerRadius: 24, shadowColor: "#565656", opacity: 0.29, x: 0, y: 4, blur: 8)
        self.designButton(button: btnAppleSignUp, backgroundColor: "#FFFFFF", padding: 6.44, cornerRadius: 24, shadowColor: "#565656", opacity: 0.29, x: 0, y: 4, blur: 8)
        self.designButton(button: btnSignUp, backgroundColor: "#FC7941", cornerRadius: 4, shadowColor: "#333333", opacity: 0.33, x: 0, y: 3, blur: 16)
        self.customizeLabel(label: lblInstructions)
        
    }

    private func designButton(
        button:UIButton,
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
        var myMutableString = NSMutableAttributedString()
        let style = NSMutableParagraphStyle()
        
        myMutableString = NSMutableAttributedString(string: lblInstructions.text ?? "", attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 12.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: "#FC7941"), range: NSRange(location:110,length:14))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: "#FC7941"), range: NSRange(location:85,length:20))
        style.lineSpacing = 10 // change line spacing between paragraph like 36 or 48
        style.alignment = .center
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: label.text?.count ?? 0))
        label.attributedText = myMutableString
    }
}
