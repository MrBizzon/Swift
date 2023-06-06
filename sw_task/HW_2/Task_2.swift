// Задание 2. Создать перечисление, которое содержит 3 вида пиццы, и создать переменные с каждым видом пиццы.

enum Coffee {
    case margaret
    case neapolitan
    case capricious
}

func getCost(coffee: Coffee) -> Double {
    switch coffee {
    case .margaret: return 150
    case .neapolitan: return 200
    case .capricious: return 300
    }      
}

print(getCost(coffee: .margaret))
print(getCost(coffee: .neapolitan))
print(getCost(coffee: .capricious))