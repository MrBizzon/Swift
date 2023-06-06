// Задание 2. Создать перечисление, которое содержит 3 вида пиццы, и создать переменные с каждым видом пиццы.

enum Coffee {
    case latte
    case cappuccino
    case espresso
}

func getCost(coffee: Coffee) -> Double {
    switch coffee {
    case .latte: return 150
    case .cappuccino: return 200
    case .espresso: return 300
    }      
}

print(getCost(coffee: .latte))
print(getCost(coffee: .cappuccino))
print(getCost(coffee: .espresso))