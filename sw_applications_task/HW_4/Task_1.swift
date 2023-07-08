import UIKit
import VK_ios_sdk

class AuthorizationViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Проверяем, авторизован ли пользователь
        if VKSdk.isLoggedIn() {
            // Переходим к списку друзей
            performSegue(withIdentifier: "FriendsSegue", sender: nil)
        } else {
            // Открываем окно авторизации
            VKSdk.authorize(["friends", "groups", "photos"])
        }
    }
    
    func vkSdkDidAuthorize(with result: VKAuthorizationResult!) {
        // Авторизация успешна, переходим к списку друзей
        performSegue(withIdentifier: "FriendsSegue", sender: nil)
    }
    
    func vkSdkAuthorizationFailed() {
        // Авторизация не удалась, выводим сообщение об ошибке
        print("Authorization failed")
    }
}

class FriendsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получаем список друзей
        VKApi.friends().get(["count": "20"]).execute(resultBlock: { response in
            // Выводим список друзей в консоль
            print(response)
        }, errorBlock: { error in
            // Выводим ошибку в консоль
            print(error)
        })
    }
}

class GroupsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получаем список групп
        VKApi.groups().get(["user_id": "123456789"]).execute(resultBlock: { response in
            // Выводим список групп в консоль
            print(response)
        }, errorBlock: { error in
            // Выводим ошибку в консоль
            print(error)
        })
    }
}

class PhotosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получаем фотографии пользователя
        VKApi.photos().getAll(["owner_id": "123456789"]).execute(resultBlock: { response in
            // Выводим список фотографий в консоль
            print(response)
        }, errorBlock: { error in
            // Выводим ошибку в консоль
            print(error)
        })
    }
}

// Контроллер авторизации проверяет, авторизован ли пользователь. Если пользователь уже авторизован, 
// то происходит переход к списку друзей. Иначе, открывается окно авторизации VK SDK. При успешной авторизации 
// вызывается метод vkSdkDidAuthorize, который также выполняет переход к списку друзей. 
// Контроллер списка друзей получает список друзей с помощью метода VKApi.friends().get и выводит результат 
// в консоль. Контроллер списка групп получает список групп с помощью метода VKApi.groups().get и выводит результат 
// в консоль. Контроллер фотографий получает фотографии пользователя с помощью метода VKApi.photos().getAll 
// и выводит результат в консоль.