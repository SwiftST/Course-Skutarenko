//: [Previous](@previous)

import Foundation

// 1. Создать строку происъзвольного текста 200 символов, создать цикл с вложенным switch, посчитать количество гласных, согласных, цифр и различных символов

let someString = "Hello! My name is Pavel. I'm from Russia. I'm 32 years old. I'm married to Darya. We live in Kemerovo city. I work north. I want to become a programmer."
var countSymbol = (vowels: 0, consonants: 0, numbers: 0, other: 0)

for char in someString {
    switch char.lowercased() {
    case "a", "e", "i", "o", "u", "y":
        countSymbol.vowels += 1
    case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m":
        countSymbol.consonants += 1
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
        countSymbol.numbers += 1
    default:
        countSymbol.other += 1
        break
    }
}
print("В строке someString:\nVowels = \(countSymbol.vowels)\nConsonents = \(countSymbol.consonants)\nNumbers = \(countSymbol.numbers)\nOther = \(countSymbol.other)")

// 2. Создать switch который будет принимать возраст человека и будет выдавать на консоль период жизни человека (детство, студенчесвто и т.д.)
let age = 32
switch age {
case 0...1:
    print("Baby")
case 2...6:
    print("Kindergarten")
case 7...17:
    print("Schoolboy")
case 18...23:
    print("Student")
case 24...50:
    print("Mature life")
case 50...:
    print("old man")
default:
    break
}

// 3. Создать студента (фамилия, имя, отчесвтво) 3 строки. Если его имя начинается с А или О обращаться к студенту по имени. Если его отчество начинается с буквы В или Д обращаться к нему по имени и отчеству. Если его фамилия начинается с буквы З или Е то обращаться к нему только по фамилии. Если ниодно из этих условий не срабоает обращаться к нему по имени отчеству и фамилии

let student = (name: "Mihail", surname: "Zotov", lastname: "Nikolaevich")

switch student {
case (let name, _, _) where name.first == "A":
    fallthrough
case (let name, _, _) where name.first == "O":
    print("Hi \(name)")
case let (_, _, name) where name.first == "V":
    fallthrough
case let (_, _, name) where name.first == "D":
    print("Hi \(student.name) \(name)")
case let (_, name, _) where name.first == "Z":
    fallthrough
case let (_, name, _) where name.first == "E":
    print("Hi \(student.name)")
default:
    print("Hi \(student.name) \(student.surname) \(student.lastname)")
}

// 4. Есть поле 10 на 10 (можно использовать цифры или буквы и цифры). Есть switch который принимает tuple -> point и в зависимости от переданных координат нужно сказать убил, ранил или мимо

// массив кораблей
var ships: [[String: Bool]] = []
var shipOne = [
    "a1": true,
    "a2": true
]
var shipTwo = [
    "d3": true
]
ships.append(shipOne)
ships.append(shipTwo)
ships.count

// координаты выстрела
let shoot = "d3"
// индекс подбитого корабля
var indexShip: Int?

// проверка попадания
for (index, ship) in ships.enumerated() {
    for (coord, _) in ship {
        if shoot == coord {
            ships[index][coord] = false
            print("Попадание")
            indexShip = index
        }
    }
}

if let index = indexShip {
    let message = ships[index].values.contains(true) ? "Ранил" : "Убил"
    print(message)
} else {
    print("Мимо")
}











//: [Next](@next)
