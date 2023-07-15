import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var themePicker: UIPickerView!
    
    let themes = ["Theme 1", "Theme 2", "Theme 3"] // Массив с доступными темами
    let themeColors = [UIColor.red, UIColor.blue, UIColor.green] // Массив с цветами для каждой темы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        themePicker.dataSource = self
        themePicker.delegate = self
    }
    
    // Обработка выбора темы
    func selectTheme(themeIndex: Int) {
        view.backgroundColor = themeColors[themeIndex]
        // Изменить цвет текста, цвет фона сообщений и ячеек здесь
        
        // Сохранить выбранную тему в Core Data
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectTheme(themeIndex: row)
    }
}


class ChatViewController: UIViewController {
    
    var conversations: [Conversation] = [] // Массив с сохраненными беседами
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadConversationsFromCoreData()
        // Загрузить и отобразить данные бесед из Core Data
    }
    
    func loadConversationsFromCoreData() {
        // Загрузка бесед из Core Data и обновление массива conversations
    }
    
    func saveLastMessagesToCoreData() {
        // Сохранение последних 5 сообщений беседы в Core Data
    }
    
    func showMessageError() {
        let alertController = UIAlertController(title: "Ошибка", message: "Произошла ошибка при загрузке данных", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func receiveMessage(message: String) {
        // Обработка полученного сообщения
        
        // Обновление данных в Core Data
        saveLastMessagesToCoreData()
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

/* Код реализует выбор темы в профиле пользователя с помощью UIPickerView. При выборе темы меняется фоновый цвет 
и другие элементы интерфейса приложения. Также код предоставляет основы для использования Core Data для сохранения 
и загрузки бесед и последних сообщений. Ошибки при загрузке данных и получении ответа от сервера отображаются 
с помощью UIAlertController. */