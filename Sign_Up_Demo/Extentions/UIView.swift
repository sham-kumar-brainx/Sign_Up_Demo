import UIKit

// MARK: - Extenstion for UIView
extension UIView {
    
    // MARK: - Internal Methods
    func addTapAction(_ action: Selector, target: Any? = nil) {
        let tapGesture = UITapGestureRecognizer(target: target ?? self, action: action)
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    func addBottomBorderWithColor(color: UIColor, borderWidth: CGFloat, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: width, height: borderWidth)
        self.layer.addSublayer(border)
    }
    
    func addBlurToView() {
        self.backgroundColor = .clear
        var blurEffect: UIBlurEffect?
        blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame =  self.bounds
        blurEffectView.alpha = 0.5
        self.addSubview(blurEffectView)
    }
}
