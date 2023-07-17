import UIKit
import CoreData

enum Theme {
    case light
    case dark
    case custom
}

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var currentTheme: Theme = .light
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserProfile()
        setTheme(currentTheme)
    }
    
    @IBAction func themeSegmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentTheme = .light
            break
        case 1:
            currentTheme = .dark
            break
        case 2:
            currentTheme = .custom
            break
        default:
            break
        }
        
        setTheme(currentTheme)
    }
    
    func setTheme(_ theme: Theme) {
        switch theme {
        case .light:
            view.backgroundColor = UIColor.white
            nameLabel.textColor = UIColor.black
            avatarImageView.backgroundColor = UIColor.lightGray
            // ...
            break
        case .dark:
            view.backgroundColor = UIColor.black
            nameLabel.textColor = UIColor.white
            avatarImageView.backgroundColor = UIColor.darkGray
            // ...
            break
        case .custom:
            break
        }
    }
    
    func loadUserProfile() {
        let request: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
        
        do {
            let profiles = try context.fetch(request)
            if let profile = profiles.first {
                nameLabel.text = profile.name
                // ...
            }
        } catch {
            print("Error loading user profile: \(error)")
        }
    }
}

class ChatViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var chatMessages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadChatMessages()
        makeChatRequest()
    }
    
    func loadChatMessages() {
        let request: NSFetchRequest<ChatMessage> = ChatMessage.fetchRequest()
        
        do {
            let messages = try context.fetch(request)
            for message in messages {
                chatMessages.append(message.text)
            }

        } catch {
            print("Error loading chat messages: \(error)")
        }
    }
    
    func makeChatRequest() {
        showErrorAlert(error)
    }
    
    func saveChatMessage(_ messageText: String) {
        let newMessage = ChatMessage(context: context)
        newMessage.text = messageText

        do {
            try context.save()
        } catch {
            print("Error saving chat message: \(error)")
        }
    }
    
    func showErrorAlert(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
