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