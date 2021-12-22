import UIKit
class SignUpViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var SignUpView: SignUpView!
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: Extention
extension SignUpViewController {
    // MARK: Actions Methods
    @IBAction
    func buttonSignUp(_ sender: UIButton) {
        guard let userData = validateData() else { return }
        let user = User(firstName: userData.firstName, lastName: userData.lastName, email: userData.email, password: userData.password, phoneNmbr: userData.phoneNumber)
        navigateToUserDetailScreen(userDetail: user)
    }
    // MARK: Private Methods
    private func validateData() -> (firstName: String, lastName: String, email: String, password: String, phoneNumber: String)? {
        let firstName = SignUpView.txfFirstName.text ?? ""
        let lastName = SignUpView.txfLastName.text ?? ""
        let email = SignUpView.txfEmail.text ?? ""
        let password = SignUpView.txfPassword.text ?? ""
        let phoneNumber = SignUpView.txfPhone.text ?? ""
        if firstName.isEmpty || !firstName.isValidText {
            UIAlertController.showAlertWith(viewController: self,  message: AppConstants.firstNameInavlidMessage)
            return nil
        }
        if lastName.isEmpty || !lastName.isValidText {
            UIAlertController.showAlertWith(viewController: self, message: AppConstants.lastNameInavlidMessage)
            return nil
        }
        if email.isEmpty || !email.isValidEmail {
            UIAlertController.showAlertWith(viewController: self, message: AppConstants.emailInvalidMessage)
            return nil
        }
        if password.isEmpty || password.count < 8 {
            UIAlertController.showAlertWith(viewController: self, message: AppConstants.passwardInavlidMessage )
            return nil
        }
        if phoneNumber.isEmpty || !phoneNumber.isValidNumber {
            UIAlertController.showAlertWith(viewController: self, message: AppConstants.phoneInvalidMessage)
            return nil
        }
        return (firstName, lastName, email, password, phoneNumber)
    }
    private func navigateToUserDetailScreen(userDetail user: User) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "userDetailview") as! UserDetailViewController
        nextViewController.details = user.description
        self.present(nextViewController, animated:true, completion:nil)
    }
}
