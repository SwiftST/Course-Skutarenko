//: [Previous](@previous)

import Foundation

// MARK: Property type

// 1. Создать структуру "Описание файла" со свойствами путь файла, имя файла, максимальный размер файла, путь к папке содержащий этот файл, тип файла (скрытый или нет), содержимое файла (какия либо строка). Использовать правильные свойства там где это нужно

struct File {
    
    static let maxSizeFile = 1000
    
    var pathToFile: String
    var isHeaden: Bool
    var size: Int {
        didSet(oldSize) {
            if size > Self.maxSizeFile {
                size = oldSize
            }
        }
    }
    
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



// 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.



enum ColorPalette: Int {
    case red = 0xFF0000
    case green = 0x00FF00
    case blue = 0x0000FF
    
    static let countColors = 3
    static let initialColor = Self.red
    static let endColor = Self.blue
}


// 3. Создать класс человек (имя, фамилия, возраст, рост, вес) добавить свойства максимальный возраст, минимальный возраст, минимальный вес, максимальный вес, максимальная длинна имени, максимальная длинна фамилии. В обсерверах сделать так чтобы значение не выставлялось если значение не соответствует. Создать свойство в классе, которое будет содержать количество созданных объектов этого класса

class Human {
    static let maxAge = 100
    static let minAge = 0
    static let minWeight = 3
    static let maxWeight = 200
    static let maxLenghtName = 7
    static let maxLenghtSurname = 10
    static var countHumans = 0
    
    var name: String {
        didSet(oldName) {
            if name.count > Self.maxLenghtName {
                print("Name too long")
                name = oldName
            }
        }
    }
    var surname: String {
        didSet(oldSurname) {
            if surname.count > Self.maxLenghtSurname {
                print("Surname too long")
                surname = oldSurname
            }
        }
    }
    var age: Int {
        didSet(oldAge) {
            if age < Self.minAge {
                print("Age can't be negative")
                age = oldAge
            } else if age > Self.maxAge {
                print("Don't live that long")
                age = oldAge
            }
        }
    }
    var height: Int
    var weight: Double {
        didSet(oldWeight) {
            if Double(Self.minWeight) > weight {
                print("Weight can't be less than \(Self.minWeight)")
                weight = oldWeight
            } else if Double(Self.maxWeight) < weight {
                print("Weight can't be more than \(Self.maxWeight)")
                weight = oldWeight
            }
        }
       
    }
    
    init(name: String, surname: String, age: Int, height: Int, weight: Double) {
        self.name = name
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        
        Self.countHumans += 1
    }
}

let human = Human(name: "Peter", surname: "Lo", age: 31, height: 182, weight: 66)
human.name = "Anastasia"
human.name
human.surname = "Pen"
human.age = -3
human.age = 200
Human.countHumans
human.weight = 201





//: [Next](@next)
