import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Открытие окна авторизации на ViewController и переход к списку друзей
        openAuthorizationWindow()
    }
    
    func openAuthorizationWindow() {
        // Нужно реализовать открытие окна авторизации        
        // После успешной авторизации переходим к списку друзей
        openFriendsList()
    }
    
    func openFriendsList() {
        // Нужно реализовать открытие экрана списка друзей        
        // Получение списка друзей
        getFriendsList()
    }
    
    func getFriendsList() {
        // Отправляем запрос на получение списка друзей 
        // Результат выводим в консоль
        print("Friends List:")
    }
    
    func openGroupsList() {
        // Нужно реализовать открытие экрана списка групп        
        // Получение списка групп
        getGroupsList()
    }
    
    func getGroupsList() {
        // Отправляем запрос на получение списка групп        
        // Результат выводим в консоль
        print("Groups List:")
        // ...
    }
    
    func openUserPhotos() {
        // Нужно реализовать открытие экрана с фотографиями пользователя
        // Получение фотографий со страницы пользователя
        getUserPhotos()
    }
    
    func getUserPhotos() {
        // Отправляем запрос на получение фотографий со страницы пользователя
        // Результат выводим в консоль
        print("User Photos:")
        // ...
    }
}

// Реализацию открытия окна авторизации, экрана списка друзей, экрана списка групп и экрана с фотографиями 
// пользователя - на усмотрение, так как они зависят от конкретной реализации проекта и UI. 
// Здесь представлены только заглушки для демонстрации последовательности действий.