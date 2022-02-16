import UIKit

// MARK: - Extenstion for UITableViewCell
extension UICollectionReusableView {
    
    // MARK: - Static Properties
    static var reuseIdentifierForHeaterAndFooter: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    static func nibForHeaterAndFooter() -> UINib {
        return UINib(nibName: self.reuseIdentifierForHeaterAndFooter, bundle: nil)
    }
}
