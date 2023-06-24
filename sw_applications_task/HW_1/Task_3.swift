// Реализовать экран с использованием сториборд (проект 2).
// Это форма реализации.
// Цвета на усмотрение, экран должен быть приближен к схеме (расположение элементов).
// В поля «Логин» и «Пароль» можно вводить текст.

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Устанавливаем заголовок контроллера представления
        title = "Login"

        // Устанавливаем цвет фона
        view.backgroundColor = UIColor.white

        // Настройка текстового поля для входа в систему
        loginTextField.placeholder = "Enter your username"
        loginTextField.borderStyle = .roundedRect
        loginTextField.autocapitalizationType = .none
        loginTextField.autocorrectionType = .no
        loginTextField.spellCheckingType = .no
        loginTextField.returnKeyType = .next

        // Настройка текстового поля пароля
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.returnKeyType = .done

        // Добляем кнопку входа в систему на панель навигации
        let loginButton = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(LoginViewController.loginButtonTapped))
        navigationItem.rightBarButtonItem = loginButton
    }

    @objc func loginButtonTapped() {
        // Обработка события нажатия кнопки входа в систему
    }
}