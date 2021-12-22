import Foundation
struct User {
    // MARK: - Varaibles and Properties
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var phoneNmbr: String
    var description: String {
      return """
      Name: \(firstName + " " + lastName)
      Email: \(email)
      Password: \(password)
      Phone Number: \("+1 "+phoneNmbr)
      """
    }
}
