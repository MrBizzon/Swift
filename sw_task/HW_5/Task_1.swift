// В рамках прошлого домашнего задания был создан класс пиццерии с переменной, в которой хранится пицца, удалите её. 
// Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии 
// была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.

struct frenchFries: MenuProtocol {
    enum frenchFriesType: String {
        case black
        case green
        case fruit
    }
    
    var type: frenchFriesType
    var name: String { type.rawValue + " French fries"}
    var cost: Double
    
    init(type: frenchFriesType, cost: Double) {
        self.type = type
        self.cost = cost
    }
    
    func getCost(sale: Int) -> Double {
        guard sale <= 50 else {
            print("Невозможно применить скидку")
            return cost
        }
        return cost - cost * Double(sale) / 100
    }
    
}

class Pizzeria {
    private var menu: [MenuProtocol]
    
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }
    
    func add(_ new: MenuProtocol) {
        menu.append(new)
    }
    
    func bbb() {}
}
