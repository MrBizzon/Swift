import UIKit
import CoreData

class ThemeViewController: UIViewController {
    
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    let themes = ["Theme 1", "Theme 2", "Theme 3"]
    
    var selectedThemeIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Theme")
        fetchRequest.fetchLimit = 1
        
        do {
            let result = try context.fetch(fetchRequest)
            if result.count > 0 {
                let theme = result[0] as! Theme
                selectedThemeIndex = Int(theme.themeIndex)
                themeSegmentedControl.selectedSegmentIndex = selectedThemeIndex
            }
        } catch {
            print("Failed to fetch theme: \(error)")
        }
        
        applyTheme()
    }
    
    @IBAction func themeChanged(_ sender: UISegmentedControl) {
        selectedThemeIndex = sender.selectedSegmentIndex
        applyTheme()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Theme")
        fetchRequest.fetchLimit = 1
        
        do {
            let result = try context.fetch(fetchRequest)
            if result.count > 0 {
                let theme = result[0] as! Theme
                theme.themeIndex = Int16(selectedThemeIndex)
            } else {
                let entity = NSEntityDescription.entity(forEntityName: "Theme", in: context)
                let theme = NSManagedObject(entity: entity!, insertInto: context) as! Theme
                theme.themeIndex = Int16(selectedThemeIndex)
            }
            
            try context.save()
        } catch {
            print("Failed to save theme: \(error)")
        }
    }
    
    func applyTheme() {
        switch selectedThemeIndex {
        case 0:
            view.backgroundColor = .white
            themeSegmentedControl.tintColor = .blue
        case 1:
            view.backgroundColor = .black
            themeSegmentedControl.tintColor = .red
        case 2:
            view.backgroundColor = .green
            themeSegmentedControl.tintColor = .yellow
        default:
            break
        }
    }
}

class Theme: NSManagedObject {
    @NSManaged var themeIndex: Int16
}
