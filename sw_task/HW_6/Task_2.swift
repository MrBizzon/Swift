// Создать класс столика, в нём должно быть свойство, в котором содержится количество мест и функция, 
// которая на вход принимает количество гостей, которое хотят посадить, 
// а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задаётся в инициализаторе.

class Table {
    var numberOfSeats: Int
    
    init(numberOfSeats: Int) {
        self.numberOfSeats = numberOfSeats
    }
    
    func checkAvailability(forGuests guests: Int) -> Bool {
        return numberOfSeats >= guests
    }
}

let table = Table(numberOfSeats: 6)

if table.checkAvailability(forGuests: 4) {
    print("Мест хватает!")
} else {
    print("Мест не хватает.")
}

// Или так полностью:

// // Создаем структуру для работника пиццерии
// struct Employee {
//     var name: String
//     var salary: Double
//     var position: String
// }

// // Создаем класс пиццерии
// class Pizzeria {
//     var employees: [Employee] = []
    
//     // Добавляем работника в массив
//     func hire(employee: Employee) {
//         employees.append(employee)
//     }
// }

// // Создаем класс столика
// class Table {
//     var seats: Int
    
//     init(seats: Int) {
//         self.seats = seats
//     }
    
//     // Функция проверяет, хватает ли мест для указанного количества гостей
//     func checkAvailability(for guests: Int) -> Bool {
//         return seats >= guests
//     }
// }