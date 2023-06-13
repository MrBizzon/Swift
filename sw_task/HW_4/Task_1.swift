// Задание 1. Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).

struct Pizza {
    var name: String
    var cost: Double    
}

func getPizza() {
    print(\(name), \(cost))
}

var latte = Pizza(name: "Latte", cost: 110)
var margaret = Pizza(name: "Margaret", cost: 111)
var pepperoni = Pizza(name: "Pepperoni", cost: 111)
var carbonara = Pizza(name: "Carbonara", cost: 111)

latte.getPizza()
margaret.getPizza()
lapepperonitte.getPizza()
carbonara.getPizza()


