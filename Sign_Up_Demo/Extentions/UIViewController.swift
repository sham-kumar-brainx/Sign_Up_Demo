import UIKit

// MARK: - Extenstion for UIViewController
extension UIViewController {
    
    // MARK: - Static Properties
    static var storyboardId: String {
        String(describing: self)
    }
    
    // MARK: - Static Methods
    static func instantiate(from storyboardName: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
    
    // MARK: - Internal Methods
    func revealViewController() -> MainViewController? {
        var viewController: UIViewController? = self
        if viewController != nil && viewController is MainViewController {
            return viewController as? MainViewController
        }
        while (!(viewController is MainViewController) && viewController?.parent != nil) {
            viewController = viewController?.parent
        }
        if viewController is MainViewController {
            return viewController as? MainViewController
        }
        return nil
    }
}
