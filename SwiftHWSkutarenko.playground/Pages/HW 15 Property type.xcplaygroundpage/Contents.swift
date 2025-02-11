//: [Previous](@previous)

import Foundation

// MARK: Property type

// MARK: - Task 1
// 1. Создать структуру "Описание файла" со свойствами путь файла, имя файла, максимальный размер файла, путь к папке содержащий этот файл, тип файла (скрытый или нет), содержимое файла (какия либо строка). Использовать правильные свойства там где это нужно

struct File {
    // type's stored property
    static let maxSizeFile = 1000
    // stored properties
    var pathToFile: String
    var isHeaden: Bool
    var size: Int {
        didSet(oldSize) {
            if size > Self.maxSizeFile {
                size = oldSize
            }
        }
    }
    // computed properties
    var name: String? {
        get {
            let temp = pathToFile.components(separatedBy: "/")
            if temp.count > 1 {
                return temp[temp.count - 1]
            }
            return nil
        }
        set {
            guard name != nil, newValue != nil else {
                return
            }
            pathToFile = String(pathToFolder!) + "/" + newValue!
        }
    }
    var pathToFolder: String? {
        guard name != nil else {
            return nil
        }
        return String(pathToFile.dropLast(name!.count + 1))
    }
    // lazy stored properties
    lazy var contentsFile = "Here will be the contents of the file"
}

var file = File(pathToFile: "", isHeaden: false, size: 100)
file.name
file.contentsFile
file.pathToFolder
file.pathToFile = "/Users/User/Documents/Учеба/Project Study"
file.name
file.pathToFolder
file.name = "Study"
file.name
file.pathToFile
file.pathToFolder


// MARK: - Task 2
// 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

enum ColorPalette: Int {
    static let numberOfColors = 3
    static let initialColor = Self.red
    static let endColor = Self.blue
    
    case red = 0xFF0000
    case green = 0x00FF00
    case blue = 0x0000FF
}


// MARK: - Task 3
// 3. Создать класс человек (имя, фамилия, возраст, рост, вес) добавить свойства максимальный возраст, минимальный возраст, минимальный вес, максимальный вес, максимальная длинна имени, максимальная длинна фамилии. В обсерверах сделать так чтобы значение не выставлялось если значение не соответствует. Создать свойство в классе, которое будет содержать количество созданных объектов этого класса

class Human {
    // stored type's properties
    static let maxAge = 100
    static let minAge = 0
    static let minWeight = 5.0
    static let maxWeight = 200.0
    static let maxNameLenght = 8
    static let maxSurnameLenght = 12
    // computed type's property
    static var numberOfHumans = 0
    
    // stored properties
    var name: String {
        didSet(oldName) {
            if name.count > Self.maxNameLenght {
                print("New name \(name) is too long. Set an old name \(oldName)")
                name = oldName
            }
        }
    }
    var surname: String {
        didSet(oldSurname) {
            if surname.count > Self.maxNameLenght {
                print("New surname \(surname) is too long. Set an old surname \(oldSurname)")
            }
        }
    }
    var age: Int {
        didSet(oldAge) {
            guard Self.minAge...Self.maxAge ~= age else {
                print("Human age incorrect. Set an old age")
                return age = oldAge
            }
        }
    }
    var height: Int
    var weight: Double {
        didSet(oldWeight) {
            guard Self.minWeight...Self.maxWeight ~= weight else {
                print("Human weight incorrect. Set an old weight")
                return weight = oldWeight
            }
        }
    }
    
    // init
    init(name: String, surname: String, age: Int, height: Int, weight: Double) {
        self.name = name
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        // подсчет количества экземпляров Human
        Self.numberOfHumans += 1
    }
}

let man = Human(name: "Oleg", surname: "Li", age: 22, height: 160, weight: 68)
man.age = 120
Human.numberOfHumans
let woman = Human(name: "Kira", surname: "Pronira", age: 45, height: 173, weight: 66)
woman.name = "abrakatabra"
Human.numberOfHumans
woman.weight = 205


//: [Next](@next)
