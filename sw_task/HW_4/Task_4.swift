// Задание 4. Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.

class PizzaWithSheath : Pizza {
    
    let priceSheath: Double
    
    init(_ name: String, _ thickness: Double, _ coefficient: Double, _ priceSheath: Double) {
        self.priceSheath = priceSheath
        super.init(name, thickness, coefficient)
    }
    
    override func getPrice(_ type: Pizza.Currency) -> Double {
        let superResult = super.getPrice(type)
        return superResult + self.priceSheath
    }
}

let firstPizzaWithSheath = PizzaWithSheath("Capricciosa", 14, 1.5, 1000)