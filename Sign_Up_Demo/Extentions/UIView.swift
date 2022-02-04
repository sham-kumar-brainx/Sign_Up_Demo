//
//  UIView.swift
//  Sign_Up_Demo
//
//  Created by BrainX IOS on 03/02/2022.
//

import Foundation
import UIKit

extension UIView {
    
    @discardableResult
    func loadFromNib<T : UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }
    
}
