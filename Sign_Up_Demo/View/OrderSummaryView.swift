import UIKit

class OrderSummaryView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var orderSummaryContentView: UIView!
    @IBOutlet weak var blurContentView: UIView!
    @IBOutlet weak var proceed: UIButton!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        proceed.layer.cornerRadius = 24
        orderSummaryContentView.layer.cornerRadius = 14
        blurContentView.addBlurToView()
    }
}
