//: [Previous](@previous)

import Foundation

// 1. создать словарь журнал студентов (ключ - имя фамилия студента, значение - оценка за контрольную). Создать 5 студентов. Повысить паре студентов оценку. Добавить еще несколько студентов. Удалить пару студентов. Посчитать общий бал группы и средний бал группы

var students = [
    "John Smith": 3,
    "Kolin Varvar": 2,
    "Sofia Loren": 5,
    "Irek Biyakin": 3,
    "Mihail Tropin": 4
]
var generalBal = 0
var averageScore = 0.0
students.updateValue(4, forKey: "John Smith")
students["Kolin Varvar"] = 3
students["Mia Malkova"] = 5
students.updateValue(4, forKey: "Serg Gorely")
students
students["Irek Biyakin"] = nil
students.removeValue(forKey: "Mihail Tropin")

for student in students {
    print("Student: \(student.key), score: \(student.value)")
    generalBal += student.value
}
averageScore = Double(generalBal) / Double(students.count)
print("Общий бал группы: \(generalBal)\nСредний бал группы: \(averageScore)")


// 2. создать дикшинари дни в месяцах ключ - месяц String, значение - количество дней в месяце (Int). вывести на экран: 1) используя цикл и тюпл, 2) пройтись по коллекции ключей
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
var months: [String: Int] = [:]
for (index, month) in nameOfMonth.enumerated() {
    months[month] = daysInMonth[index]
}

for (month, days) in months {
    print("Month: \(month), days: \(days)")
}

for month in months.keys {
    print("Month: \(month), days: \(months[month]!)")
}

// 3. Создать дикшинари ключ - адрес ячейки шахматной ("a5", "e6") String, значение - Bool. Если ячейка белая то true, черная false

var chessCells: [String: Bool] = [:]

for (index, letter) in "abcdefgh".enumerated() {
    for number in 1...8 {
        chessCells["\(letter)\(number)"] = (index + number) % 2 == 0
    }
}

for cell in chessCells {
    let color = cell.value ? "white" : "black"
    print("Ячейка \(cell.key) is \(color)")
}




//: [Next](@next)
