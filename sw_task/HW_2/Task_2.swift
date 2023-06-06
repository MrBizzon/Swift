// Задание 2. Создать перечисление, которое содержит 3 вида пиццы, и создать переменные с каждым видом пиццы.

enum Pizza {
    case margaret
    case neapolitan
    case capricious
}

func getCost(pizza: Pizza) -> Double {
    switch pizza {
    case .margaret: return 150
    case .neapolitan: return 200
    case .capricious: return 300
    }      
}

print(getCost(pizza: .margaret))
print(getCost(pizza: .neapolitan))
print(getCost(pizza: .capricious))