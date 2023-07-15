// Добавление тем в профиль пользователя

// Создание модели темы
struct Theme {
    var name: String
    var backgroundColor: UIColor
    var textColor: UIColor
    var messageBackgroundColor: UIColor
    var cellColor: UIColor
}

// Создание списка доступных тем
let themes = [
    Theme(name: "Тема 1", backgroundColor: .white, textColor: .black, messageBackgroundColor: .systemBlue, cellColor: .systemGray),
    Theme(name: "Тема 2", backgroundColor: .black, textColor: .white, messageBackgroundColor: .systemYellow, cellColor: .systemGray),
    Theme(name: "Тема 3", backgroundColor: .systemPink, textColor: .white, messageBackgroundColor: .systemTeal, cellColor: .systemGray)
]

// Обновление интерфейса при выборе темы
func updateInterface(with theme: Theme) {
    // Обновление фона в приложении
    view.backgroundColor = theme.backgroundColor
    
    // Обновление цвета текста
    textLabel.textColor = theme.textColor
    
    // Обновление цвета фона отправляемого и получаемого сообщения
    messageBackgroundView.backgroundColor = theme.messageBackgroundColor
    
    // Обновление цвета ячеек
    tableView.backgroundColor = theme.cellColor
    
    // ...
}

// Обработка выбора темы пользователем
func themeSelection() {
    let themeAlert = UIAlertController(title: "Выберите тему", message: nil, preferredStyle: .actionSheet)
    
    for theme in themes {
        let action = UIAlertAction(title: theme.name, style: .default) { _ in
            // Обновление интерфейса при выборе темы
            updateInterface(with: theme)
            
            // Сохранение выбранной темы в профиле пользователя
            // ...
        }
        themeAlert.addAction(action)
    }
    
    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
    themeAlert.addAction(cancelAction)
    
    present(themeAlert, animated: true, completion: nil)
}

// Добавление Core Data

// Импорт модуля Core Data
import CoreData

// Создание модели данных беседы
class Chat: NSManagedObject {
    @NSManaged var conversation: String
    @NSManaged var lastMessages: [String]
}

// Создание функции для сохранения беседы и последних сообщений
func saveChat(conversation: String, lastMessages: [String]) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Chat", in: managedContext)!
    let chat = NSManagedObject(entity: entity, insertInto: managedContext)
    
    chat.setValue(conversation, forKey: "conversation")
    chat.setValue(lastMessages, forKey: "lastMessages")
    
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save chat. \(error), \(error.userInfo)")
    }
}

// Получение данных из Core Data
func getChats() -> [Chat] {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return []
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Chat")
    
    do {
        let chats = try managedContext.fetch(fetchRequest) as! [Chat]
        return chats
    } catch let error as NSError {
        print("Could not fetch chats. \(error), \(error.userInfo)")
        return []
    }
}

// Отображение данных из Core Data
func displayChats() {
    let chats = getChats()
    
    for chat in chats {
        // Отображение бесед в интерфейсе
        // ...
        
        // Отображение последних сообщений в интерфейсе
        // ...
    }
}

// Обновление данных в Core Data
func updateChat(with response: APIResponse) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Chat")
    fetchRequest.predicate = NSPredicate(format: "conversation == %@", response.conversation)
    
    do {
        let chat = try managedContext.fetch(fetchRequest).first as! Chat
        
        // Обновление последних сообщений
        chat.lastMessages = response.lastMessages
        
        try managedContext.save()
    } catch let error as NSError {
        print("Could not update chat. \(error), \(error.userInfo)")
    }
}

// Обработка ответа на запрос
func handleResponse(response: APIResponse) {
    if response.error != nil {
        // Отображение ошибки пользователю
        // ...
    } else {
        // Отображение новых данных
        // ...
        
        // Обновление данных в Core Data
        updateChat(with: response)
    }
}

/*Код, который добавляет функциональность выбора темы в приложении с использованием UIKit и Core Data. 
Некоторые части кода, такие как обновление интерфейса или отображение ошибки, являются заглушками и требуют 
дополнительной реализации*/