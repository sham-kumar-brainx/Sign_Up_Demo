import UIKit

class CheckoutView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var paymentButtonView: UIView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        topView.layer.applySketchShadow(color: UIColor.hexStringToUIColor(hex: AppConstants.topViewShadowColorHex), alpha: 0.2, x: 0, y: 3, blur: 4)
        paymentButtonView.layer.cornerRadius = 24
    }
}
