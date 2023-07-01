// По клику на ячейку из пункта 1 должен быть переход на экран, 
// напоминающий экран переписки. Экран должен быть приближен к схеме.

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let cellIdentifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем таблицу и настраиваем
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
    }
    
    // Количество секций (в данном случае 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.imageView?.image = UIImage(named: "image")
        cell.textLabel?.text = "Название ячейки"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // Обработка нажатий на ячейки и кнопку "Войти"
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Кнопка "Войти" нажата
            let controller = SomeController()
            navigationController?.pushViewController(controller, animated: true)
        } else {
            // Ячейка нажата
            let chatController = ChatController()
            navigationController?.pushViewController(chatController, animated: true)
        }
    }
}

class SomeController: UIViewController {
    // Контроллер, на который переходим при нажатии на кнопку "Войти"
}

class ChatController: UIViewController {
    // Контроллер, на который переходим при нажатии на ячейку
}
