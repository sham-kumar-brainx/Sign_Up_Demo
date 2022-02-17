import UIKit

class SideMenuView: UIView {

    //MARK: - Outlets
    @IBOutlet weak var shareButtonView: UIView!
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var myOrdersTab: SideMenuActionView!
    @IBOutlet weak var paymentTab: SideMenuActionView!
    @IBOutlet weak var addressesTab: SideMenuActionView!
    @IBOutlet weak var shopsTab: SideMenuActionView!
    @IBOutlet weak var settingsTab: SideMenuActionView!
    @IBOutlet weak var signOut: UIButton!
    
    // MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        shareButtonView.layer.cornerRadius = 18
        signOut.layer.cornerRadius = 15
        signOut.layer.borderWidth = 1
        signOut.layer.borderColor = UIColor.hexStringToUIColor(hex: AppConstants.orangeColorHex).cgColor
        myOrdersTab.setTitle(LocalizedKey.myOrders.string)
        paymentTab.setTitle(LocalizedKey.payment.string)
        addressesTab.setTitle(LocalizedKey.addresses.string)
        shopsTab.setTitle(LocalizedKey.shops.string)
        settingsTab.setTitle(LocalizedKey.settings.string)
    }
}
