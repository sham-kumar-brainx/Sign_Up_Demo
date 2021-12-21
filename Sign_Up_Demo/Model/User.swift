//
//  User.swift
//  Sign_Up_Demo
//
//  Created by BrainX IOS on 20/12/2021.
//

import Foundation

struct User {
    var fName: String
    var lName: String
    var email: String
    var password: String
    var phoneNmbr: String
    
    var description: String {
      return """
      Name: \(fName + " " + lName)
      Email: \(email)
      Password: \(password)
      Phone Number: \("+1 "+phoneNmbr)
      """
    }
}
