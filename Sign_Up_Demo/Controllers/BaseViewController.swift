import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        disableDarkMode()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Private Methods
    private func disableDarkMode() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
}
