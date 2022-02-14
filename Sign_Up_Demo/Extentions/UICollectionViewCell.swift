import Foundation
import UIKit

// MARK: Extenstion for UITableViewCell
extension UICollectionViewCell {
    
    // MARK: Static Properties
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
