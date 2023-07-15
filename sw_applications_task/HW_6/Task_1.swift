import UIKit

class ProfileViewController: UIViewController {
    // ...
    
    let themes = ["Тема 1", "Тема 2", "Тема 3"]
    var selectedTheme: String?
    
    // ...
    
    @IBAction func changeThemeButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Выберите тему", message: nil, preferredStyle: .actionSheet)
        
        for theme in themes {
            let action = UIAlertAction(title: theme, style: .default) { [weak self] (action) in
                self?.selectedTheme = theme
                self?.applyTheme()
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func applyTheme() {
        guard let theme = selectedTheme else {
            return
        }
        
        switch theme {
        case "Тема 1":
            // Установить фоновое изображение или цвет
            view.backgroundColor = UIColor.white
            // Установить цвет текста
            label.textColor = UIColor.black
            // Установить цвет фона отправляемого и получаемого сообщения
            messageBackgroundView.backgroundColor = UIColor.lightGray
            // Установить цвет ячеек
            tableView.backgroundColor = UIColor.white
        case "Тема 2":
            // Установить другое фоновое изображение или цвет
            view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
            // Установить другой цвет текста
            label.textColor = UIColor.white
            // Установить другой цвет фона отправляемого и получаемого сообщения
            messageBackgroundView.backgroundColor = UIColor.darkGray
            // Установить другой цвет ячеек
            tableView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        case "Тема 3":
            // Установить еще одно фоновое изображение или цвет
            view.backgroundColor = UIColor.blue
            // Установить еще один цвет текста
            label.textColor = UIColor.white
            // Установить еще один цвет фона отправляемого и получаемого сообщения
            messageBackgroundView.backgroundColor = UIColor.cyan
            // Установить еще один цвет ячеек
            tableView.backgroundColor = UIColor.blue
        default:
            break
        }
    }
}

// Использование:
let profileViewController = ProfileViewController()
profileViewController.changeThemeButtonTapped(UIButton())