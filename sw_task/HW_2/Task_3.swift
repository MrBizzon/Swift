// задание 3. Добавить возможность получения названия пиццы через rawValue.

enum Coffee: String {
    case margaret
    case neapolitan
    case capricious
}


func getName(coffee: Coffee) -> String {
    coffee.rawValue
}


print(getName(coffee: .margaret))
print(getName(coffee: .neapolitan))
print(getName(coffee: .capricious))