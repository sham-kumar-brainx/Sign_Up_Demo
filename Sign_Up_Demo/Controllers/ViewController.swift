//
//  ViewController.swift
//  Sign_Up_Demo
//
//  Created by BrainX IOS on 15/12/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userView: UserView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController {
    @IBAction func btnSignUp(_ sender: UIButton) {
        print("Button Clicked!")
        let fName = userView.txfFirstName.text ?? ""
        let lName = userView.txfLastName.text ?? ""
        let email = userView.txfEmail.text ?? ""
        let password = userView.txfPassword.text ?? ""
        let phoneNumber = userView.txfPhone.text ?? ""


        if fName.isEmpty || fName.isValidText {
            showAlertWithMsg(message: "Invalid First Name!\nIt must contain only Alphabats (A-Z or a-z).")
            return
        }
        if lName.isEmpty || lName.isValidText {
            showAlertWithMsg(message: "Invalid Last Name!\nIt must contain only Alphabats (A-Z or a-z).")
            return
        }
        if email.isEmpty || !email.isValidEmail {
            print(email.isValidEmail)
            showAlertWithMsg(message: "Invalid Email!\nIt must be like abc@pqr.xyz etc.")
            return
        }
        if password.isEmpty || password.count < 8 {
            showAlertWithMsg(message: "Invalid Password! \n It must be more than 8 characters")
            return
        }
        if phoneNumber.isEmpty || !phoneNumber.isValidNumber {
            showAlertWithMsg(message: "Invalid Phone Number!\nIt must be of 9 to 11 digits")
            return
        }
        let user = User(fName: fName, lName: lName, email: email, password: password, phoneNmbr: phoneNumber)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "userDetailview") as! UserDetailViewController
        nextViewController.details = user.description
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
    private func showAlertWithMsg(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default ))
        self.present(alert, animated: true, completion: nil)
    }
    
}





