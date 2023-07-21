//: [Previous](@previous)

import Foundation

// 1. Создать массив с количесвтом дней в месяце. Вывесте количество дней в месяцах. Создать массив с наименованиями мясяцов по порядку. Вывести через принт название месяца и количесвто дней в этом месяце. Создать третий массив тюплов (название месяца, количесвто дней в месяце). Вывести через принт. Вывсести через принт количество дней наоборот. Посчитать сколько дней от начала года до определенной даты

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let nameOfMonth = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octomber",
    "November",
    "December"
]
var months: [(String, Int)] = []

for index in 0..<nameOfMonth.count {
    print("\(nameOfMonth[index]) - \(daysInMonth[index])")
    months += [(nameOfMonth[index], daysInMonth[index])]
}

for (month, days) in months.reversed() {
    print("\(month) - \(days)")
}

let date = (m: "Octomber", d: 24)
var result = 0
for (month, days) in months {
    if month == date.m {
        result += date.d - 1
        break
    } else {
        result += days
    }
}
result


// 2. Создать массив опциональный Int? в цикле посчитать сумму. Сделать это несколькими способами. Первый используя Optional binding, второй способ - используя force unwrapping, третий - используя оператор объединения по nil (??)

let numbers = [4, nil, 22, 3, nil, 50]
var sum = 0
for number in numbers {
    if let num = number {
        sum += num
    }
}
sum
sum = 0
for number in numbers {
    if number != nil {
        sum += number!
    }
}
sum
sum = 0
for number in numbers {
    sum += number ?? 0
}
sum


// 3. создайте строку алфавит и пустой массив строк в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед
let convertArray = Array(97...122).map { a in
    Character(UnicodeScalar(a)!.escaped(asASCII: true))
}
var alphabet = String(convertArray)
var someArray: [String] = []
for letter in alphabet {
    someArray.insert(String(letter), at: 0)
}
someArray



//: [Next](@next)
