enum Coffee: String {
    case latte
    case cappuccino
    case espresso
    }


    
func getName(coffee: Coffee) -> String {
    coffee.rawValue
}


print(getName(coffee: .latte))
print(getName(coffee: .cappuccino))
print(getName(coffee: .espresso))