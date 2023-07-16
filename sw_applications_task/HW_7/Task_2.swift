import UIKit
import CoreData

enum Theme: String {
    case light = "Light"
    case dark = "Dark"
    case colorful = "Colorful"
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var themePickerView: UIPickerView!
    
    lazy var themes: [Theme] = [.light, .dark, .colorful]
    var selectedTheme: Theme = .light
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        themePickerView.delegate = self
        themePickerView.dataSource = self
        
        nameLabel.text = "Oleg Zubarev"
        avatarImageView.image = UIImage(named: "avatar")
    }
    
    func saveThemeToCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Profile", in: managedContext)!
        let profile = NSManagedObject(entity: entity, insertInto: managedContext)
        
        profile.setValue(selectedTheme.rawValue, forKey: "theme")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save theme to Core Data. \(error), \(error.userInfo)")
        }
    }
}

extension ProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themes[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTheme = themes[row]
        saveThemeToCoreData()
        updateInterface()
    }
}

func updateInterface() {
    let theme = selectedTheme
    
    switch theme {
    case .light:
        break
    case .dark:
        break
    case .colorful:
        break
    }
}

class CoreDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchConversationsFromCoreData()
    }
    
    func fetchConversationsFromCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Conversation")
        
        do {
            let conversations = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch conversations from Core Data. \(error), \(error.userInfo)")
        }
    }
    
    func saveMessagesToCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Message", in: managedContext)!
        let message = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save messages to Core Data. \(error), \(error.userInfo)")
        }
    }
    
    func handleError(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
