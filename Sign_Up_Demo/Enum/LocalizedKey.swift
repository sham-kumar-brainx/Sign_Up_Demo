import Foundation

enum LocalizedKey: String {
    
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    case greetings = "Good afternoon,Miguel"
    case deliveryTitle = "Delivery to Door"
    case deliverDescription = "ASAP - 18 New Avenida SO, San"
    case title = "NICELY NONDAIRY"
    case subTitle = "Say yes to sips of"
    case orderingMessage = "What do you ordering today?"
    case verticalHeaderIdentifier = "VerticalCollectionViewHeader"
    case horizentalFooterIdentifier = "HorizentalCollectionViewHeader"
    case invalidMessage = "Invalid element type"
    case food = "Food"
    case superMarket = "Super Market"
    case alcoholDelivery = "Alcohol Delivery"
    case pets = "Pets"
    case pharmacy = "Pharmacy"
    case flowersAndGifts = "Flowers and Gifts"
    case personalCare = "Personal Care"
    case mall = "Mall"
    case cupGlass = "Cup Glass"
}
