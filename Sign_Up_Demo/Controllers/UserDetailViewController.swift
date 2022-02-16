import UIKit

class UserDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Internal Properties
    var details: String?
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      textView.text = details
    }
}
