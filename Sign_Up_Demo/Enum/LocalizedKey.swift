import Foundation

enum LocalizedKey: String {
    
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    case greetings = "Good afternoon,Miguel"
    case deliveryTitle = "Delivery to Door"
    case deliverDescription = "ASAP - 18 New Avenida SO, San"

}
