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
    
    var myMutableString = NSMutableAttributedString()
    var style = NSMutableParagraphStyle()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createSubviews()
    }
    
    func createSubviews() {
        // all the layout code from above
        btnFbSignUp.configuration?.imagePadding = 6.44
        btnFbSignUp.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        btnFbSignUp.layer.applySketchShadow(color: UIColor.hexStringToUIColor(hex: "#565656"), alpha: 0.29, x: 0, y: 4, blur: 16, spread: 0)
        
        btnAppleSignUp.configuration?.imagePadding = 9.29
        btnAppleSignUp.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        btnAppleSignUp.layer.applySketchShadow(color: UIColor.hexStringToUIColor(hex: "#565656"), alpha: 0.29, x: 0, y: 4, blur: 8, spread: 0)


        txfPhone.borderStyle = UITextField.BorderStyle.none
        phoneView.layer.borderWidth = 0.5
        phoneView.layer.borderColor = UIColor.hexStringToUIColor(hex: "#CCCCCC").cgColor
        phoneView.layer.cornerRadius = 4


        btnSignUp.backgroundColor = UIColor.hexStringToUIColor(hex: "#FC7941")
        btnSignUp.layer.cornerRadius = 4
        btnSignUp.layer.applySketchShadow(color: UIColor.hexStringToUIColor(hex: "#333333"), alpha: 0.33, x: 0, y: 3, blur: 16, spread: 0)

        myMutableString = NSMutableAttributedString(string: lblInstructions.text ?? "", attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 12.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: "#FC7941"), range: NSRange(location:110,length:14))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.hexStringToUIColor(hex: "#FC7941"), range: NSRange(location:85,length:20))
        style.lineSpacing = 10 // change line spacing between paragraph like 36 or 48
        style.alignment = .center
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: lblInstructions.text?.count ?? 0))
        lblInstructions.attributedText = myMutableString
    }
    

}
