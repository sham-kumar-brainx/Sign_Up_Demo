import UIKit

class UserDetailViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Internal Properties
    var details: String?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = details
    }
}
