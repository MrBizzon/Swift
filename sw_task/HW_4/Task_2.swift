// Задание 2. Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки 
// (например, дополнительно добавить пепперони, помидоры, сыр). 
// Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

let name: String = "Capricciosa" //Имя
let thickness: Double = 1 //Толщина теста
let coefficient: Double = 1.2 //Коэффицент за толщину теста

let sausage: Double = 100 //руб. за колбасу
let cheese: Double = 70 //руб. за сыр
let tomatoes: Double = 80 //руб. за томаты
let markupOnGoods: Double = 0.4 //наценка на продукцию

func getPriceRuble() -> Double {
    let costOfPizza = (sausage + cheese + tomatoes) * coefficient
    return costOfPizza * markupOnGoods
}

let rub = getPriceRuble()
print(rub)