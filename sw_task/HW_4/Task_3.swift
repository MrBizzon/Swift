// Задание 3. Создать класс пиццерии, добавить массив с возможными видами пиццы. 
// Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.

let sausage: Double = 100 //руб. за колбасу
let cheese: Double = 70 //руб. за сыр
let tomatoes: Double = 80 //руб. за томаты
let markupOnGoods: Double = 0.4 //наценка на продукцию

let firstPizza = Pizza("firstPizza", 14, 1.5)
let secondPizza = Pizza("secondPizza", 16, 1.8)

class Pizza {
    
    //Свойства класса
    let thickness: Double
    let name: String
    let coefficientOne: Double
    let coefficientTwo: Double
    
    //Инициализатор класса
    init
    (
        _ name: String,
        _ thickness: Double,
        _ coefficientOne: Double
        _ coefficientTwo: Double
    )

    {
        self.name = name
        self.thickness = thickness
        self.coefficientOne = coefficientOne
        self.coefficientTwo = coefficientTwo
    }
    
    //Метод класса
    func getPrice(_ type: Currency) -> Double {
        let costOfPizza = (sausage + cheese + tomatoes) * coefficientOne
        let costOfPizza = (sausage + cheese + tomatoes) * coefficientTwo
            
            switch type
            {
            case .costOne:
                return costOfPizza * markupOnGoods
            case .costTwo:
                return costOfPizza * markupOnGoods
            }
            
        }
    
    enum Currency {
        case costOne
        case costTwo
    }
    
}


