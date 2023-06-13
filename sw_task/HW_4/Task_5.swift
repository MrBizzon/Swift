// Задание 5. Создать экземпляр класса пиццерии и добавить в него несколько видов пицц.

class Pizzeria {
    
    static let shared = Pizzeria()
    var myFirstPizza = 1
    var mySecondPizza: Int
    
    init(_ pizza: Int){
        self.mySecondPizza = myFirstPizza * 2
        self.myMethod()
    }
    init(){
        self.mySecondPizza = 0
        self.myMethod()
    }
    
    func myMethod(){
        self.myFirstPizza += 1
    }
}

let pizza = Pizzeria(5)
print(pizza.mySecondPizza)
print(Pizzeria.shared.mySecondPizza)