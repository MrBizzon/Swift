// Задание 4. Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.

class Pizza {
    
    static let shared = Pizza()
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

let pizza = Pizza(5)
print(pizza.mySecondPizza)
print(Pizza.shared.mySecondPizza)