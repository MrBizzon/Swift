import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Открываем экран авторизации при запуске приложения
        showAuthorizationScreen()
    }
    
    func showAuthorizationScreen() {
        // Создаем экземпляр контроллера авторизации
        let authorizationViewController = AuthorizationViewController()
        authorizationViewController.delegate = self
        
        // Отображаем экран авторизации
        self.present(authorizationViewController, animated: true, completion: nil)
    }
    
    func showFriendsListScreen() {
        // Создаем экземпляр контроллера списка друзей
        let friendsListViewController = FriendsListViewController()
        
        // Отображаем список друзей
        self.navigationController?.pushViewController(friendsListViewController, animated: true)
        
        // Получаем список друзей
        getFriendsList()
    }
    
    func showGroupsListScreen() {
        // Создаем экземпляр контроллера списка групп
        let groupsListViewController = GroupsListViewController()
        
        // Отображаем список групп
        self.navigationController?.pushViewController(groupsListViewController, animated: true)
        
        // Получаем список групп
        getGroupsList()
    }
    
    func showPhotosScreen() {
        // Создаем экземпляр контроллера фотографий
        let photosViewController = PhotosViewController()
        
        // Отображаем экран с фотографиями
        self.navigationController?.pushViewController(photosViewController, animated: true)
        
        // Получаем фотографии со страницы пользователя
        getPhotos()
    }
    
    func getFriendsList() {
        // Отправляем запрос на получение списка друзей
        APIManager.shared.getFriendsList { result in
            switch result {
            case .success(let friends):
                for friend in friends {
                    print(friend.name)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getGroupsList() {
        // Отправляем запрос на получение списка групп
        APIManager.shared.getGroupsList { result in
            switch result {
            case .success(let groups):
                for group in groups {
                    print(group.name)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getPhotos() {
        // Отправляем запрос на получение фотографий пользователя
        APIManager.shared.getPhotos { result in
            switch result {
            case .success(let photos):
                for photo in photos {
                    print(photo.url)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension ViewController: AuthorizationViewControllerDelegate {
    func didAuthorize() {
        // После авторизации открываем экран списка друзей
        showFriendsListScreen()
    }
}

class AuthorizationViewController: UIViewController {
    weak var delegate: AuthorizationViewControllerDelegate?
    
    // Реализация экрана авторизации
    
    func authorize() {
        // Выполняем авторизацию
        
        // Вызываем метод делегата для обработки успешной авторизации
        delegate?.didAuthorize()
    }
}

protocol AuthorizationViewControllerDelegate: class {
    func didAuthorize()
}

class FriendsListViewController: UIViewController {
    // Реализация экрана списка друзей
}

class GroupsListViewController: UIViewController {
    // Реализация экрана списка групп
}

class PhotosViewController: UIViewController {
    // Реализация экрана с фотографиями
}

class APIManager {
    static let shared = APIManager()
    
    func getFriendsList(completion: @escaping (Result<[Friend], Error>) -> Void) {
        // Отправляем запрос на получение списка друзей
        
        // Возвращаем результат
        let friends: [Friend] = [] // Полученные данные
        
        completion(.success(friends))
    }
    
    func getGroupsList(completion: @escaping (Result<[Group], Error>) -> Void) {
        // Отправляем запрос на получение списка групп
        
        // Возвращаем результат
        let groups: [Group] = [] // Полученные данные
        
        completion(.success(groups))
    }
    
    func getPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        // Отправляем запрос на получение фотографий пользователя
        
        // Возвращаем результат
        let photos: [Photo] = [] // Полученные данные
        
        completion(.success(photos))
    }
}

struct Friend {
    let name: String
}

struct Group {
    let name: String
}

struct Photo {
    let url: String
}