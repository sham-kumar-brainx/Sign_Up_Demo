import UIKit

// MARK: - Extenstion for UIView
extension UIView {
    
    // MARK: - Internal Methods
    func addTapAction(_ action: Selector, target: Any? = nil) {
        let tapGesture = UITapGestureRecognizer(target: target ?? self, action: action)
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: CGFloat(AppConstants.sideMenuWidth), height: width)
        self.layer.addSublayer(border)
    }
}
