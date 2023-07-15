import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var themePicker: UIPickerView!
    
    let themes = ["Theme 1", "Theme 2", "Theme 3"] // Массив доступных тем
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        themePicker.dataSource = self
        themePicker.delegate = self
        
        // Загрузка выбранной темы пользователя из Core Data и установка соответствующих цветов в приложении
        if let selectedTheme = loadDataFromCoreData() {
            applyTheme(theme: selectedTheme)
        }
    }
    
    @IBAction func saveThemeButtonTapped(_ sender: UIButton) {
        let selectedThemeIndex = themePicker.selectedRow(inComponent: 0)
        let selectedTheme = themes[selectedThemeIndex]
        
        // Сохранение выбранной темы пользователя в Core Data
        saveDataToCoreData(theme: selectedTheme)
        
        // Применение выбранной темы в приложении
        applyTheme(theme: selectedTheme)
    }
    
    func loadDataFromCoreData() -> String? {
        // Загрузка данных из Core Data, например, используя NSManagedObject
        // ...
        
        // Возвращает выбранную тему или nil, если данных в Core Data нет
        return nil
    }
    
    func saveDataToCoreData(theme: String) {
        // Сохранение данных в Core Data, например, используя NSManagedObject
        // ...
    }
    
    func applyTheme(theme: String) {
        // Применение выбранной темы в приложении
        // Например, изменение цвета фона, текста и других элементов интерфейса
        // ...
    }
    
}

extension ProfileViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themes[row]
    }
    
}

/*Используется модуль CoreData для сохранения выбранной темы пользователя и его последних сообщений. 
В данном примере, функции для работы с CoreData (loadDataFromCoreData() и saveDataToCoreData()) представлены 
как заглушки и требуют дополнительной реализации в соответствии с требованиями приложения.*/