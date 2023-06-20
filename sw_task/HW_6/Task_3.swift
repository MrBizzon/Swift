class PizzaRestaurant { 
  var tables: [Table] = []
  
  init() {
    for i in 1...10 {
      let table = Table(cafe: self, number: i)
      tables.append(table)
    }
  }
}

class Table {
  let cafe: PizzaRestaurant
  let number: Int
  
  init(cafe: PizzaRestaurant, number: Int) {
    self.cafe = cafe
    self.number = number
  }
}
Результат:

class PizzaRestaurant {
  var tables: [Table] = []
  
  init() {
    for i in 1...10 {
      let table = Table(cafe: self, number: i)
      tables.append(table)
    }
  }
}

class Table {
  let cafe: PizzaRestaurant
  let number: Int
  
  init(cafe: PizzaRestaurant, number: Int) {
    self.cafe = cafe
    self.number = number
  }
}


// Либо так:

// struct Employee {
//     var name: String
//     var salary: Double
//     var position: Position
    
//     enum Position {
//         case cashier
//         case cook
//     }
// }

// class PizzaRestaurant {
//     var employees: [Employee] = []
//     var tables: [Table] = []
    
//     class Table {
//         var capacity: Int
//         var restaurant: PizzaRestaurant
        
//         init(capacity: Int, restaurant: PizzaRestaurant) {
//             self.capacity = capacity
//             self.restaurant = restaurant
//         }
        
//         func checkAvailability(for guestsCount: Int) -> Bool {
//             return guestsCount <= capacity
//         }
//     }
    
//     init(tablesCount: Int, tableCapacity: Int) {
//         for _ in 1...tablesCount {
//             tables.append(Table(capacity: tableCapacity, restaurant: self))
//         }
//     }
// }