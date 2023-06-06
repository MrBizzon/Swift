enum Coffee: String {
    case latte = "Latte"
    case cappuccino = "Cappuccino"
    case espresso = "Espresso"
}

// let coffeeName = Coffee.latte.rawValue

func getName(coffee: Coffee) -> String {
    coffee.rawValue
}


print(getName(coffee: .latte))
print(getName(coffee: .cappuccino))
print(getName(coffee: .espresso))