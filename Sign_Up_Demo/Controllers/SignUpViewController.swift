import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var signUpView: SignUpView!
    
    // MARK: Private Properties
    var user: User?
}

// MARK: Extention
extension SignUpViewController {
    
    // MARK: Actions Methods
    @IBAction
    func buttonSignUp(_ sender: UIButton) {
        setSignupData()
        let validationState = validateData()
        switch validationState {
        case .valid:
            proceedToUserDetailViewController()
        case let .invalid(message):
            showAlertWith(message: message)
        }
    }
    
    // MARK: Private Methods
    private func setSignupData() {
        guard let firstName = signUpView.txfFirstName.text,
              let lastName = signUpView.txfLastName.text,
              let email = signUpView.txfEmail.text,
              let password = signUpView.txfPassword.text,
              let phoneNumber = signUpView.txfPhone.text else {
                  return
              }
        user = User(firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber)
    }
    
    func validateData() -> TextFieldValidationStatus {
        if user?.firstName.isEmpty ?? true || !(user?.firstName.isValidText ?? true) {
            return TextFieldValidationStatus.invalid(message: AppConstants.firstNameInavlidMessage)
        }
        if user?.lastName.isEmpty ?? true || !(user?.lastName.isValidText ?? true) {
            return TextFieldValidationStatus.invalid(message: AppConstants.lastNameInavlidMessage)
        }
        if user?.email.isEmpty ?? true || !(user?.email.isValidEmail ?? true) {
            return TextFieldValidationStatus.invalid(message: AppConstants.emailInvalidMessage)
        }
        if user?.password.isEmpty ?? true || (user?.password.count ?? 0) < 8 {
            return TextFieldValidationStatus.invalid(message: AppConstants.passwardInavlidMessage)
        }
        if user?.phoneNumber.isEmpty ?? true || !(user?.phoneNumber.isValidNumber ?? true) {
            return TextFieldValidationStatus.invalid(message: AppConstants.phoneInvalidMessage)
        }
        return .valid
    }
    
    private func proceedToUserDetailViewController() {
        let userDetailViewController = UIViewController.instantiate(UserDetailViewController.self, fromStoryboard: .Main)
        userDetailViewController.details = user?.description
        self.present(userDetailViewController, animated:true, completion:nil)
    }
}
