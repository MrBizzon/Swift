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