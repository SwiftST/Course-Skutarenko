//: [Previous](@previous)

import Foundation

// MARK: Property types

// Глобальная переменная или константа видна ото всюду
// Глобальные константы/переменные объявляются в стиле UpperCamelCase

let MaxNameLenght = 20


class Human {
    
    static let maxAge = 100
    
    var name : String {
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    lazy var storyOfMyLife = "This is a story of my entire life..."
    
    var age: Int {
        didSet {
            if age > Self.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum Direction {
    
    static let enumDescription = "Directions in the game"
    
    case Left
    case Right
    case Top
    case Bottom
    
    var isVertical: Bool {
        return self == .Top || self == .Bottom
    }
    var isHorizontal: Bool {
        !isVertical
    }
}

let d = Direction.Right
d.isHorizontal
d.isVertical

Direction.enumDescription


struct Cat {
    
    var name: String {
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    static let maxAge = 20
    
    static var totalCats = 0
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Self.totalCats += 1
    }
    
}

let human = Human(name: "Peter", age: 40)
human.storyOfMyLife

var cat = Cat(name: "Whiten", age: 10)

human.age = 1000
cat.age = 50
Cat.totalCats

let cat1 = Cat(name: "Murzik", age: 10)

Cat.totalCats
cat.name = "sfdgdfbfgdbvdvbsdvbsdbv "

// У свойст типа отсутствует конструктор (они не инициализируются), поэтому всегда должно быть задано дефолтное значение

// Экземпляр перечисления (enum) не может иметь stored property, однако сам тип перечисления может иметь stored property



//: [Next](@next)
