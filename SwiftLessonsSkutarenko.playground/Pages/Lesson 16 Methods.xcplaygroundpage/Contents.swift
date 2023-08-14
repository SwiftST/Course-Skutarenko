//: [Previous](@previous)

import Foundation

// MARK: Methods

// Методы - это те же самые функции, которые просто ассоциируются с каким либо типом
// Методы могут принадлежать экземплярам или самомому типу
// Функция самого типа не знает о существовании экземпляров, для него существуют только свойства и методы типа

struct Point {
    var x: Int
    var y: Int
    
    mutating func moveBy(x: Int, andY y: Int) {
        self = Point(x: self.x + x, y: self.y + y)
    }
}

enum Color {
    static func numberOfElements() -> Int {
        self.print()
        return 2
    }
    
    case White, Black
    
    mutating func invert() -> Color  {
        if self == .White {
            self = .Black
        } else {
            self = .White
        }
        self.print()
        return self
        //self = self == .Black ? .White : .Black
    }
    func print() {
        if self == .White {
            Swift.print("Black")
        } else {
            Swift.print("White")
        }
    }
    
    static func print() {
        Swift.print("enum")
    }
}

var color = Color.White
Color.numberOfElements()

color.invert().print()


func move(point: Point, byX x: Int, andY y: Int) -> Point {
    return Point(x: point.x + x, y: point.y + y)
}

var p = Point(x: 1, y: 1)
p = move(point: p, byX: 2, andY: 4)

p.moveBy(x: 5, andY: 7)














//: [Next](@next)
