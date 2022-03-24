//
//  SideMenuCell.swift
//  CustomSideMenuiOSExample
//
//  Created by John Codeos on 2/7/21.
//

import UIKit

class SideMenuCell: UITableViewCell {
    
    // MARK: - Class Properties
//    class var identifier: String { return String(describing: self) }
//    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    // MARK: - Outlets
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public Methods
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setImage(_ image: String) {
        iconImageView.image = UIImage(named: image)
    }
}
