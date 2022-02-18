import UIKit

class SideMenuViewController: BaseViewController {
    
    // MARK: - Outlets
    
    
    // MARK: - Internal Properties
    var defaultHighlightedCell: Int = 0
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    @IBAction func crossTaped(_ sender: UIButton) {
        revealViewController()?.revealSideMenu()
    }
}
