//: [Previous](@previous)

import Foundation

// MARK: Properties

// 1. Повторить все что было на уроке

// 2. Добавить для структуры студент свойство дата рождения (dob), которое будет тоже реализована как структура Birthday.

// 3. Добавить computed property которое будет считать сколько студенту лет на основании dob.

// 4. Добавить еще одно computed property которое будет считать сколько студент учился (количество лет - 6), если меньше 6 лет то возвращать ноль

struct DateOfBirth {
    enum Month: Int {
        case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
    }
    var year: Int
    var month: Month
    var day: Int {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            guard let date = dateFormatter.date(from: "\(year)-\(month)-\(day)") else {
                print("\(day).\(month.rawValue).\(year) - invalid date. Day did set \(oldValue) instead of \(day)")
                day = oldValue
                return
            }
        }
    }
}

struct Student {
    var name: String {
        willSet {
            print("will set " + newValue + " instead of " + name)
        }
        didSet {
            print("did set " + name + " instaed of " + oldValue)
            name = name.capitalized
        }
    }
    var surname: String {
        willSet {
            print("will set " + newValue + " instead of " + surname)
        }
        didSet {
            print("did set " + surname + " instaed of " + oldValue)
            surname = surname.capitalized
        }
    }
    var fullName: String {
        get {
            name.capitalized + " " + surname.capitalized
        }
        set {
            let temp = newValue.components(separatedBy: " ")
            if temp.count > 0 {
                name = temp[0]
            }
            if temp.count > 1 {
                surname = temp[1]
            }
        }
    }
    var dateOfBirth: DateOfBirth
    var age: Int {
        let currentDay = Calendar.current.component(.day, from: Date())
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentYear = Calendar.current.component(.year, from: Date())
        switch (dateOfBirth.day, dateOfBirth.month.rawValue, dateOfBirth.year) {
        case let (d, m, y) where currentMonth > m:
            fallthrough
        case let (d, m, y) where (m == currentMonth && currentDay >= d):
            return currentYear - y
        default:
            return currentYear - dateOfBirth.year - 1
        }
    }
    
    var yearOfStudy: Int {
        let result = age > 6 ? age - 6 : 0
        switch result {
        case 0: print("The student doesn't study")
        case 0...11: print("Schoolboy")
        case 12...15: print("Bachelor")
        case 16...17: print("Master")
        case 18...: print("professor")
        default:
            break
        }
        return result
    }
}

var student = Student(name: "as", surname: "sdd", dateOfBirth: DateOfBirth(year: 1990, month: .sep, day: 16))

student.name
student.surname
student.name = "oLeg"
student.surname = "eremin"
student.name
student.surname
student.fullName
student.fullName = "koNor mcGregor"
student.name
student.surname
student.fullName

student.age
student.dateOfBirth.month = .feb
student.dateOfBirth.day = 30
student.yearOfStudy


// 5. Создать структуру отрезок, у которой будут две внутрение структуры "точка". Структура отрезок содержит две точки А и В и это stored property, а так же два computed propertied, первое это midle point это точка между двумя точками А и В, второе длинна вашего отрезка.

struct Cut {
    var a: Point
    var b: Point
    var midlePoint: Point {
        get {
            Point(x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
        }
        set {
            let (oldX, oldY) = (midlePoint.x, midlePoint.y)
            a.x = newValue.x - (oldX - a.x)
            a.y = newValue.y - (oldY - a.y)
            b.x = newValue.x - (oldX - b.x)
            b.y = newValue.y - (oldY - b.y)
        }
        
    }
    var length: Double {
        get {
            sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
        }
        set {
            
        }
    }
}

struct Point {
    var x: Double
    var y: Double
}

var someCut = Cut(a: Point(x: 1, y: 2), b: Point(x: 3, y: 2))
someCut.midlePoint
someCut.length
someCut.midlePoint = Point(x: 5, y: 2)
someCut.a
someCut.b










/*
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
*/
// 6. При изменении midlePoint точка А и В должны перенестись
/*
var someCut = Cut(pointA: Point(x: 2, y: 3), pointB: Point(x: 4, y: 3))
someCut.midlePoint
someCut.midlePoint.x = 5
someCut.midlePoint.y = 8
someCut.pointA
someCut.pointB
*/
// 7. Если мы меняем длинну то точка А остается на месте а точка B изменяется в соответствии с новой длинной
/*
someCut.length
someCut.length = 3
someCut.pointA
someCut.pointB
*/










//: [Next](@next)
