import UIKit
import CoreData

enum Theme {
    case light
    case dark
    case custom
    
    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.black
        case .custom:
            return UIColor.gray
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .light:
            return UIColor.black
        case .dark:
            return UIColor.white
        case .custom:
            return UIColor.blue
        }
    }
}

class UserProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    var selectedTheme: Theme = .light
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.textColor = selectedTheme.textColor
        avatarImageView.backgroundColor = selectedTheme.backgroundColor
        themeSegmentedControl.selectedSegmentIndex = getSelectedSegmentIndex(for: selectedTheme)
    }
    
    @IBAction func themeChanged(_ sender: UISegmentedControl) {
        selectedTheme = getSelectedTheme(from: sender.selectedSegmentIndex)
        nameLabel.textColor = selectedTheme.textColor
        avatarImageView.backgroundColor = selectedTheme.backgroundColor
    }
    
    func getSelectedSegmentIndex(for theme: Theme) -> Int {
        switch theme {
        case .light:
            return 0
        case .dark:
            return 1
        case .custom:
            return 2
        }
    }
    
    func getSelectedTheme(from index: Int) -> Theme {
        switch index {
        case 0:
            return .light
        case 1:
            return .dark
        case 2:
            return .custom
        default:
            return .light
        }
    }
}

class Conversation: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var lastMessages: [String]
}

class ChatViewController: UIViewController {
    var managedObjectContext: NSManagedObjectContext!
    var conversations: [Conversation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchConversations()
    }
    
    func fetchConversations() {
        let fetchRequest: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        
        do {
            conversations = try managedObjectContext.fetch(fetchRequest)
        } catch {
            showAlert(with: error.localizedDescription)
        }
    }
    
    func saveConversation(_ name: String, lastMessages: [String]) {
        let conversation = Conversation(context: managedObjectContext)
        conversation.name = name
        conversation.lastMessages = lastMessages
        
        do {
            try managedObjectContext.save()
        } catch {
            showAlert(with: error.localizedDescription)
        }
    }
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
