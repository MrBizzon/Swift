// Создайте протокол, в котором будут содержаться функции открытия и закрытия.

protocol Pizzeria {
    func work()
}

class Open: Pizzeria {
    func work() {
        print("Открыто")
    }
}

class Closed: Pizzeria {
    func work() {
        print("Закрыто")
    }
}
