//
//  UserDetailViewController.swift
//  Sign_Up_Demo
//
//  Created by BrainX IOS on 20/12/2021.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    var details: String?
    
        override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      textView.text = details
    }
}
