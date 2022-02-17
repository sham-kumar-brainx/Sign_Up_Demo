import Foundation

struct User {
    
    // MARK: - Internal Properties
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var phoneNumber: String
    var description: String {
      return """
      Name: \(firstName + " " + lastName)
      Email: \(email)
      Password: \(password)
      Phone Number: \("+1 "+phoneNumber)
      """
    }
}
