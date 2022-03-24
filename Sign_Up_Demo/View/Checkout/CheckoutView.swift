import UIKit

class CheckoutView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var paymentButtonView: UIView!
    @IBOutlet weak var addressView: PaymentDetailView!
    @IBOutlet weak var contactView: PaymentDetailView!
    @IBOutlet weak var asapCheckboxView: PaymentMethodView!
    @IBOutlet weak var scheduleCheckboxView: PaymentMethodView!
    @IBOutlet weak var pickUpCheckboxView: PaymentMethodView!
    @IBOutlet weak var paymentMethodView: PaymentDetailView!
    @IBOutlet weak var subTotalView: PriceDisplayingView!
    @IBOutlet weak var taxView: PriceDisplayingView!
    @IBOutlet weak var deliveryView: PriceDisplayingView!
    @IBOutlet weak var discountsView: PriceDisplayingView!
    @IBOutlet weak var totalPriceView: PriceDisplayingView!
    @IBOutlet weak var promoCodeView: PromoCodeView!
    @IBOutlet weak var heightForInvoiceTaxView: NSLayoutConstraint!
    @IBOutlet weak var invoiceTaxView: UIView!
    @IBOutlet weak var heightForScrollContentView: NSLayoutConstraint!
    @IBOutlet weak var controlSwitchButton: UIButton!
    @IBOutlet weak var tipsSegmentedControl: UISegmentedControl!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        setUpData()
    }
    
    // MARK: - Private Methods
    private func configureView() {
        topView.layer.applySketchShadow(color: UIColor.hexStringToUIColor(hex: AppConstants.topViewShadowColorHex), alpha: 0.2, x: 0, y: 3, blur: 4)
        paymentButtonView.layer.cornerRadius = 24
        discountsView.heading.textColor = UIColor.hexStringToUIColor(hex: AppConstants.darkBlueColorHex)
        discountsView.price.textColor = UIColor.hexStringToUIColor(hex: AppConstants.darkBlueColorHex)
        totalPriceView.heading.font = totalPriceView.heading.font.withSize(16)
        totalPriceView.heading.textColor = .black
        tipsSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        totalPriceView.price.font = totalPriceView.heading.font.withSize(16)
    }
    
    private func setUpData() {
        addressView.setData(heading: LocalizedKey.addressHeading.string, headingDescription: LocalizedKey.addressHeadingDescription.string)
        contactView.setData(heading: LocalizedKey.contactInformation.string, headingDescription: LocalizedKey.contanctInformationDescription.string)
        paymentMethodView.setData(heading: LocalizedKey.paymentMethodHeading.string, headingDescription: LocalizedKey.paymentMethodHeadingDescription.string)
        asapCheckboxView.setData(heading: LocalizedKey.asap.string, imageName: LocalizedKey.filledCircle.string)
        scheduleCheckboxView.setData(heading: LocalizedKey.schedule.string, imageName: LocalizedKey.emptyCircle.string)
        pickUpCheckboxView.setData(heading: LocalizedKey.pickUp.string, imageName: LocalizedKey.emptyCircle.string)
        subTotalView.setData(heading: LocalizedKey.subTotalPrice.string, price: 10.00)
        taxView.setData(heading: LocalizedKey.taxIdHeading.string, price: 2.00)
        deliveryView.setData(heading: LocalizedKey.delivery.string, price: 0.00)
        discountsView.setData(heading: LocalizedKey.discounts.string, price: -5.00)
        totalPriceView.setData(heading: LocalizedKey.total.string, price: 12.00)
        promoCodeView.setHeading(LocalizedKey.promoCodeMessage.string)
    }
    
    // MARK: - Internal Methods
    func toggleControlSwitch(shouldSelect: Bool) {
        shouldSelect ? controlSwitchButton.setImage(UIImage(named: LocalizedKey.selectedControlSwitch.string), for: .normal) : controlSwitchButton.setImage(UIImage(named: LocalizedKey.unselectedControlSwitch.string), for: .normal)
    }
}
