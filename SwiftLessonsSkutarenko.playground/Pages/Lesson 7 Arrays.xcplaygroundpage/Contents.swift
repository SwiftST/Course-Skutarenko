//: [Previous](@previous)

import Foundation

// Неизменяемый массив
let constArray = ["a", "b", "c", "d"]
constArray.count

if !constArray.isEmpty {
    print("Not empty")
}

// Изменяемый массив
var array: [String] = []

array += constArray

// Добавление элемент
array += ["e"]
array.append("f")

// Изменение элемента (синтаксис сабскриптов)
array[0] = "1"
array

// Добавление элемента по индексу
array.insert("-", at: 3)

// удаление элемента по индексу
array.remove(at: 3)

// Изменение группы элементов
array[1...3] = []
array

let money = [100, 1, 5, 20, 1, 50, 1, 1, 20, 1]

//let repeatedArray = [Int](repeating: 100, count: 10)
var sum = 0

for index in 0..<money.count {
    sum += money[index]
}
sum
sum = 0

for value in money {
    sum += value
}
sum

for (index, value) in money.enumerated() {
    print("index = \(index) value = \(value)")
}






//: [Next](@next)
