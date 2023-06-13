// Задание 2. Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки 
// (например, дополнительно добавить пепперони, помидоры, сыр). 
// Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

let name: String = "Capricciosa" //Имя
let coefficientOne: Double = 1.5 //Коэффицент за тонкое тесто
let coefficientTwo: Double = 1.8 //Коэффицент за толстое тесто

let sausage: Double = 100 //руб. за колбасу
let cheese: Double = 70 //руб. за сыр
let tomatoes: Double = 80 //руб. за томаты
let markupOnGoods: Double = 0.4 //наценка на продукцию

func CostPerThinDough() -> Double {
    let costOfPizza = (sausage + cheese + tomatoes) * coefficientOne
    return costOfPizza * markupOnGoods
}

func CostForThickDough() -> Double {
    let costOfPizza = (sausage + cheese + tomatoes) * coefficientTwo
    return costOfPizza * markupOnGoods
}

let costOne = CostPerThinDough()
print(costOne)
let costTwo = CostForThickDough()
print(costTwo)