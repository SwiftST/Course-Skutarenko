//: [Previous](@previous)

import Foundation

// MARK: Dictionary
// Словарь - некпорядоченная коллекция состоящая из пар ключ-значений. Ключи должны соответствовать протоколу Hashable и быть уникальными

// Полная форма записи словаря Dictionary<Key,Value>
// Cокращенная форма записи [Key: Value]

// Создание пустого словаря (синтаксис инициализатора)
var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "sixteen"
// если тип словаря уже известен
namesOfIntegers = [:]

// создание словаря с литералом словаря
var airports = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin"
]

// MARK: Доступ и изменение словаря
print("The airports dictionary contains \(airports.count) items")

if airports.isEmpty {
    print("The airport dictionary is empty")
} else {
    print("The airport dictionary is not empty")
}

// добавление элемента с помощью синтаксиса сабскриптов
airports["LHR"] = "London"

// так жк можно использовать синтаксис сабскриптов для изменения значения по ключу или его удаление
airports["LHR"] = "London Heathrow"

// в качестве альтернативы сабскриптам можно использовать метод updateValue(forKey:). метод updateValue(forKey:) возвращает опциональное значение соответствующее типу значения словаря

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("the oldValue for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary")
}

// удаление элемента словаря (синтаксис сабскриптов)
airports["APL"] = "Apple International"
airports["APL"] = nil

// удаление элемента словаря (метод removeValue(forKey:))
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airport dictionary does not contain a value for DUB")
}

// Итерация по словарю

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// если нужно использовать ключи или значения словаря вместе с какими-либо API, которое принимает объект Array, то можно инициализировать новый массив с помощью свойств keys и values:
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// для упорядочивания можно использовать метод sortes()





//: [Next](@next)
