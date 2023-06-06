// задание 3. Добавить возможность получения названия пиццы через rawValue.

enum Pizza: String {
    case margaret
    case neapolitan
    case capricious
}


func getName(pizza: Pizza) -> String {
    pizza.rawValue
}


print(getName(pizza: .margaret))
print(getName(pizza: .neapolitan))
print(getName(pizza: .capricious))