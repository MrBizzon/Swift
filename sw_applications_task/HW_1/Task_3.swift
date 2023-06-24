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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Your login logic here
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        // Your forgot password logic here
    }
    
}
# Login Screen

![Login Screen](login_screen.png)

- Login Text Field
- Password Text Field
- Login Button
- Forgot Password Button