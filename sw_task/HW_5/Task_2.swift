// Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.

class Pizzeria {
   private var menu: [MenuProtocol]

   init(menu: [MenuProtocol]) {
       self.menu = menu
   }

   func add(_ new: MenuProtocol) {
       menu.append(new)
   }
}
