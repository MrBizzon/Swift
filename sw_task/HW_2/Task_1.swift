// Задание 1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, 
// следующий аргумент — это годовой процент, третий аргумент — это срок функция возвращает сколько денег получит пользователь по итогу.


var summ: Float = 50000
var proc: Float = 5.5
var year: Int = 3

func vklad(){
    for _ in 1 ... year {
        let newSumm = summ + (summ / proc)
        summ = newSumm
    }

print("Через", year, "года набежит", summ , "рублей")
}

vklad()
