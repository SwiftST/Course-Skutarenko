//: [Previous](@previous)

import Foundation

// MARK: Properties

// 1. Повторить все что было на уроке

// 2. Добавить для структуры студент свойство дата рождения (dob), которое будет тоже реализована как структура Birthday.

// 3. Добавить computed property которое будет считать сколько студенту лет на основании dob.

// 4. Добавить еще одно computed property которое будет считать сколько студент учился (количество лет - 6), если меньше 6 лет то возвращать ноль

struct Birthday {
    
    enum Month: Int {
        case jan = 1, feb, mar, apr, may, june, july, aug, sept, oct, nov, dec
    }
    var day: Int
    var month: Month
    var year: Int
}

struct Student {
    var name: String {
        willSet {
            print("Will set \(newValue) instead of \(name)")
        }
        didSet {
            print("Did set \(name) instead of \(oldValue)")
            name = name.capitalized
        }
    }
    var surname: String {
        didSet {
            print("Did set \(name) instead of \(oldValue)")
            surname = surname.capitalized
        }
    }
    var dob: Birthday
    
    var fullname: String {
        get {
            return name + " " + surname
        }
        set(newValue) {
            let string = newValue.components(separatedBy: " ")
            if string.count > 0 {
                name = string[0]
            }
            if string.count > 1 {
                surname = string[1]
            }
        }
    }
    
    var age: Int {
        let day = Calendar.current.component(.day, from: Date())
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())

        switch (dob.day, dob.month.rawValue, dob.year) {
        case let(d, m, y) where m < month:
            fallthrough
        case let(d, m, y) where m == month && d <= day:
            return year - y
        default:
            return year - dob.year - 1
        }
    }
    
    var yearsOfStudy: Int {
        age > 6 ? age - 6 : 0
    }
}

var student = Student(name: "Ron", surname: "Iz", dob: Birthday(day: 6, month: .aug, year: 1990))
student.age
student.yearsOfStudy


student.name = "iGoR"
student.name
student.fullname
student.fullname = "mIra jUks"
student.fullname

// 5. Создать структуру отрезок, у которой будут две внутрение структуры "точка". Структура отрезок содержит две точки А и В и это stored property, а так же два computed propertied, первое это midle point это точка между двумя точками А и В, второе длинна вашего отрезка.

struct Point {
    var x: Double
    var y: Double
}

struct Cut {
    var pointA: Point
    var pointB: Point
    var midlePoint: Point {
        get {
            Point(x: (pointA.x + pointB.x) / 2, y: (pointA.y + pointB.y) / 2)
        }
        set {
            let (oldX, oldY) = (midlePoint.x, midlePoint.y)
            pointA.x = newValue.x - (oldX - pointA.x)
            pointA.y = newValue.y - (oldY - pointA.y)
            pointB.x = newValue.x - (oldX - pointB.x)
            pointB.y = newValue.y - (oldY - pointB.y)
        }
        
    }
    var length: Double {
        get {
            sqrt(pow(pointB.x - pointA.x, 2) + pow(pointB.y - pointA.y, 2))
        }
        set {
            let (coefX, coefY) = ((pointB.x - pointA.x) / length, (pointB.y - pointA.y) / length)
            pointB.x = coefX * newValue + pointA.x
            pointB.y = coefY * newValue + pointA.y
        }
        
    }
}

// 6. При изменении midlePoint точка А и В должны перенестись

var someCut = Cut(pointA: Point(x: 2, y: 3), pointB: Point(x: 4, y: 3))
someCut.midlePoint
someCut.midlePoint.x = 5
someCut.midlePoint.y = 8
someCut.pointA
someCut.pointB

// 7. Если мы меняем длинну то точка А остается на месте а точка B изменяется в соответствии с новой длинной
someCut.length
someCut.length = 3
someCut.pointA
someCut.pointB











//: [Next](@next)
