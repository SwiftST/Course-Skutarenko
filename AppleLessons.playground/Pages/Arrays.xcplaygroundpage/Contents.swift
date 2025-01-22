//: [Previous](@previous)

import Foundation

// MARK: Arrays
// Массивы хранят множество значений одинакового типа в упорядоченном списке
// Полная форма записи: Array<Element> где Element указывает на тип данных который будет хранится в массиве
// Сокращенная форма: [Element]

// создание пустого массива (синтаксис инициализатора)
var someInts = [Int]()
print("someInts is of type \(type(of: someInts)) with \(someInts.count) items")
someInts.append(3)
// создание пустого массива с помощью пустого литерала массива
someInts = []

// создание массива с дефолтным значением
var threeDoubles = Array(repeating: 0.0, count: 3)
type(of: threeDoubles)

// создание массива путем объединения двух массивов
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

// создание массива через литералы массива
var shoppingList = ["Eggs", "Milk"]

// MARK: Доступ и изменение массива
// Можно получить достп к массиву и изменять его с помощью его методов и свойств либо через синтаксис сабскриптов

print("The shoppingList contains \(shoppingList.count) items")

if shoppingList.isEmpty {
    print("The shoppng list is empty")
} else {
    print("The shopping list is not empty")
}
// добавление елемента в конец массива
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// извлечение значения из массива с помощью синтаксиса сабскриптов
var firstItem = shoppingList[0]

// изменение существующего значения с помощью синтаксиса сабскриптов
shoppingList[0] = "Six eggs"

// изменение диапазона значений
shoppingList[4...6] = ["Bananas", "Apples"]

// вставка элемента по заданному индексу
shoppingList.insert("Maple Syrup", at: 0)

// удаление элемента по указанному индексу
let mapleSyrup = shoppingList.remove(at: 0)

// При попытке получить доступ или изменить значение индекса, который находится за пределами существующих границ массива, будет ошибка исполнения.
//shoppingList[6]
firstItem = shoppingList[0]

// удаление последнего элемента массива
let apples = shoppingList.removeLast()

// итерация по массиву
for item in shoppingList {
    print(item)
}
for (index, value) in shoppingList.enumerated() {
    print("Index \(index + 1): \(value)")
}

// array slice
var shoppingOne = shoppingList[1...3]
type(of: shoppingOne)




//: [Next](@next)
