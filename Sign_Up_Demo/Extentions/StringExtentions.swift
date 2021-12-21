//
//  StringExtentions.swift
//  Sign_Up_Demo
//
//  Created by BrainX IOS on 21/12/2021.
//

import Foundation


extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    var isValidText: Bool {
        NSPredicate(format: "SELF MATCHES %@", ".*[^A-Za-z].*").evaluate(with: self)
    }
    var isValidNumber: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^[0-9]{9,11}$").evaluate(with: self)
    }
    
}
