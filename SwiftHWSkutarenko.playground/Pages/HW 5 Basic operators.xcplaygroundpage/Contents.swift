//: [Previous](@previous)

import Foundation

// MARK: Basic operators

// 1. Посчитать количество секунда от начала года до ДР. Високостный год игнорируется

// 2. Посчитать в каком квартале вы родились. Вывести на экран

// 3. Инкременты отстутствуют (неактуально)

// 4. Есть шахматная доска. Задается ячейка (x, y), нужно опреелить какое это поле черное или белое

// 1
let secondInHour = 60 * 60
let secondInDay = secondInHour * 24
let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let myBirthday = (month: 10, day: 24)
var sumSeconds = 0

for (month, days) in daysInMonth.enumerated() {
    if month + 1 == myBirthday.month {
        sumSeconds += (secondInDay * myBirthday.day) - secondInDay
        break
    }
    sumSeconds += days * secondInDay
}
print("До моего день рождения с начала года \(sumSeconds) сек")

// 2
var quarter = ""
if 1...3 ~= myBirthday.month {
    quarter = "first quater"
} else if 4...6 ~= myBirthday.month {
    quarter = "second quater"
} else if 7...9 ~= myBirthday.month {
    quarter = "third quater"
} else if 10...12 ~= myBirthday.month {
    quarter = "four quater"
} else {
    print("Incorrect value")
}
print("I was born in the \(quarter)")

// 4
let coordinate = (x: "d", y: 6)
let x = "abcdefgh"

var count = 1
for i in x {
    if i == Character(coordinate.x) {
        let color = (count + coordinate.y) % 2 == 0 ? "black" : "white"
        print("Color field is \(coordinate.x)\(coordinate.y) is \(color)")
        break
    }
    count += 1
}









//: [Next](@next)
