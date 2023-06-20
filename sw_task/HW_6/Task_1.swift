// Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. 
// Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками.

struct PizzaEmployee {
    var name: String
    var salary: Double
    var position: Position
}

enum Position {
    case cashier, cook
}

class PizzaShop {
    var employees: [PizzaEmployee] = []
}
