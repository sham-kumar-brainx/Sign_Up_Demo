import UIKit
extension UIAlertController {
    class func showAlertWith(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default ))
        viewController.present(alert, animated: true, completion: nil)
    }
}
