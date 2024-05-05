//: [Previous](@previous)

import Foundation

// 1. Создать строку происъзвольного текста 200 символов, создать цикл с вложенным switch, посчитать количество гласных, согласных, цифр и различных символов

let someString = "Hello! Can I ask you a few questions? How can I get to the airport? Where can I find terminal №3?"
var countSymbol = [
    "vowels": 0,
    "consonants": 0,
    "numbers": 0,
    "other": 0
]

for char in someString {
    switch char.lowercased() {
    case "a", "e", "i", "o", "u", "y":
        countSymbol["vowels"]! += 1
    case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m":
        countSymbol["consonants"]! += 1
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
        countSymbol["numbers"]! += 1
    default:
        countSymbol["other"]! += 1
    }
}
print("В строке someString:\nVowels = \(countSymbol["vowels"]!)\nConsonents = \(countSymbol["consonants"]!)\nNumbers = \(countSymbol["numbers"]!)\nOther = \(countSymbol["other"]!)")

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
var greeting = "Hello, "

switch student {
case let (name, _, _) where name.hasPrefix("O"):
    fallthrough
case let (name, _, _) where name.hasPrefix("A"):
    greeting += name
case let (_, _, name) where name.hasPrefix("V"):
    fallthrough
case let (_, _, name) where name.hasPrefix("D"):
    greeting += student.name + " " + name
case let (_, name, _) where name.hasPrefix("Z"):
    fallthrough
case let (_, name, _) where name.hasPrefix("E"):
    greeting += name
default:
    greeting += student.name + " " + student.surname + " " + student.lastname
}
print(greeting)


// second variant
/*
switch student {
case (let name, _, _) where name.first == "A":
    fallthrough
case (let name, _, _) where name.first == "O":
    print("Hi \(name)")
case let (name, _, lastname) where lastname.first == "V":
    fallthrough
case let (name, _, lastname) where lastname.first == "D":
    print("Hi \(name) \(lastname)")
case let (name, surname, _) where surname.first == "Z":
    fallthrough
case let (name, surname, _) where surname.first == "E":
    print("Hi \(surname)")
default:
    print("Hi \(student.name) \(student.surname) \(student.lastname)")
}
*/

// 4. Есть поле 10 на 10 (можно использовать цифры или буквы и цифры). Есть switch который принимает tuple -> point и в зависимости от переданных координат нужно сказать убил, ранил или мимо

// Словарь поле боя - Ключ это координаты ячейки, Значение это статус по координате (0 - пустое поле, 1 - живой, 2 - ранен, 3 - мимо)

var shipOne = [
    "a1": true
]
var shipTwo = [
    "d3": true,
    "d4": true
]
var shipThree = [
    "h8": true,
    "g8": true,
    "f8": true
]
var ships = [shipOne, shipTwo, shipThree]

// создание поля боя
var battlefield: [String: Int] = [:]
for y in 1...10 {
    for x in "abcdefghij" {
        battlefield["\(x)\(y)"] = 0
    }
}

// добавляем корабли на поле
for ship in ships {
    for coord in ship.keys {
        if ship[coord]! {
            battlefield[coord] = 1
        }
    }
}

// печать поля боя
for y in (1...10).reversed() {
    print(y, terminator: y == 10 ? " " : "  ")
    for x in "abcdefghij" {
        switch battlefield["\(x)\(y)"] {
        case 0:
            print("◻︎", terminator: " ")
        case 1:
            print("◼︎", terminator: " ")
        case 2:
            print("✷", terminator: " ")
        case 3:
            print("●", terminator: " ")
        default:
            break
        }
    }
    print("")
}
print("   a b c d e f g h i j")

// координаты выстрела
var shoot = (x: "d", y: "3")
// индекс подбитого корабля
var indexShip: Int?

// проверка на попадание
for (index, ship) in ships.enumerated() {
    if let a = ship["\(shoot.x + shoot.y)"] {
        ships[index]["\(shoot.x + shoot.y)"] = false
        battlefield["\(shoot.x + shoot.y)"] = 2
        indexShip = index
        print("Есть попадание")
        break
    }
}

if let index = indexShip {
    print(ships[index].values.contains(true) ? "Ранил" : "Убил")
} else {
    battlefield["\(shoot.x + shoot.y)"] = 3
    print("Мимо")
}

// печать поля боя
for y in (1...10).reversed() {
    print(y, terminator: y == 10 ? " " : "  ")
    for x in "abcdefghij" {
        switch battlefield["\(x)\(y)"] {
        case 0:
            print("◻︎", terminator: " ")
        case 1:
            print("◼︎", terminator: " ")
        case 2:
            print("✷", terminator: " ")
        case 3:
            print("●", terminator: " ")
        default:
            break
        }
    }
    print("")
}
print("   a b c d e f g h i j")



/*
var battlefield: [String: Int] = [:]
for coordY in 1...10 {
    for coordX in "abcdefghij" {
        battlefield["\(coordX)\(coordY)"] = 0
    }
}

var ships: [[String: Bool]] = []
var shipOne = [
    "a1": true,
    "a2": true
]
var shipTwo = [
    "d4": true
]
ships.append(shipOne)
ships.append(shipTwo)

// добавляем корабли на поле
for (_, ship) in ships.enumerated() {
    for coord in ship.keys {
        if ship[coord] == true {
            battlefield[coord] = 1
        }
    }
}

// печать поля с кораблями
for coordY in (1...10).reversed() {
    if coordY == 10 {
        print(coordY, terminator: " ")
    } else {
        print(coordY, terminator: "  ")
    }
    
    for coordX in "abcdefghij" {
        switch battlefield["\(coordX)\(coordY)"]! {
        case 0:
            print("◻︎", terminator: " ")
        case 1:
            print("◼︎", terminator: " ")
        case 2:
            print("✷", terminator: " ")
        case 3:
            print("●", terminator: " ")
        default:
            break
        }
    }
    print("")
}
print("   a b c d e f g h i j")

// координаты выстрела
var shoot = "a1"
// индекс подбитого корабля в массиве
var indexShip: Int?

// проверка есть ли на корректность введенных координат
guard (battlefield[shoot] != nil) else {
    fatalError("Введены некорректные координаты")
}

for (index, ship) in ships.enumerated() {
    for coord in ship.keys {
        if shoot == coord {
            ships[index][shoot] = false
            indexShip = index
            print("Попадание")
            battlefield[shoot] = 2
        }
    }
}

// проверка живой ли корабль
if let index = indexShip {
    let message = ships[index].values.contains(true) ? "Ранил" : "Убил"
    print(message)
} else {
    battlefield[shoot] = 3
    print("Мимо")
}

// печать поля с кораблями
for coordY in (1...10).reversed() {
    if coordY == 10 {
        print(coordY, terminator: " ")
    } else {
        print(coordY, terminator: "  ")
    }
    
    for coordX in "abcdefghij" {
        switch battlefield["\(coordX)\(coordY)"]! {
        case 0:
            print("◻︎", terminator: " ")
        case 1:
            print("◼︎", terminator: " ")
        case 2:
            print("✷", terminator: " ")
        case 3:
            print("●", terminator: " ")
        default:
            break
        }
    }
    print("")
}
print("   a b c d e f g h i j")





/*
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
*/

*/








//: [Next](@next)
