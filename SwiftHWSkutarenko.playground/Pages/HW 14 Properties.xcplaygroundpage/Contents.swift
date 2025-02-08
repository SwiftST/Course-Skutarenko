//: [Previous](@previous)

import Foundation

// MARK: Properties

// 1. Повторить все что было на уроке
// 2. Добавить для структуры студент свойство дата рождения (dob), которое будет тоже реализована как структура Birthday.

// 3. Добавить computed property которое будет считать сколько студенту лет на основании dob.

// 4. Добавить еще одно computed property которое будет считать сколько студент учился (количество лет - 6), если меньше 6 лет то возвращать ноль

// MARK: - Tasks from 1 to 4
struct StudentSt {
    // MARK: Struct Date of birth
    struct DateOfBirth {
        enum Month: Int, CaseIterable {
            case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
        }
        
        var year: Int
        var month: Month
        var day: Int {
            didSet {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                guard let date = dateFormatter.date(from: "\(year)-\(month.rawValue)-\(day)") else {
                    print("Incorrect date (day is \(day)). Returning old value day is \(oldValue)")
                    day = oldValue
                    return
                }
            }
        }
    }
    
    // MARK: Stored properties
    var firstName: String {
        willSet(newFirstName) {
            print("will set \(newFirstName) instead of \(firstName)")
        }
        didSet(oldName) {
            print("did set \(firstName) instead of \(oldName)")
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    var dateOfBirth: DateOfBirth
    
    // MARK: computed properties
    var age: Int {
        get {
            let currentDay = Calendar.current.component(.day, from: Date())
            let currentMonth = Calendar.current.component(.month, from: Date())
            let currentYear = Calendar.current.component(.year, from: Date())
            guard currentYear > dateOfBirth.year else { return 0 }
            switch (dateOfBirth.day, dateOfBirth.month.rawValue) {
            case let(d, m) where m < currentMonth:
                fallthrough
            case let(d, m) where m == currentMonth && d <= currentDay:
                return currentYear - dateOfBirth.year
            default:
                return currentYear - dateOfBirth.year - 1
            }
        }
    }
    
    var yearsOfStudy: Int {
        let result = age > 6 ? age - 6 : 0
        var message = "The student studies for \(result) years. He is "
        
        switch result {
        case 0: message = "The student doesn't study"
        case ..<12: message += "a schoolbay"
        case ..<17: message += "a student"
        case 6...: message += "a professor"
        default: break
        }
        
        print(message)
        return result
    }
    
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set(newValue) {
            let temp = newValue.components(separatedBy: " ")
            if temp.count > 0 {
                firstName = temp[0]
            }
            if temp.count > 1 {
                lastName = temp[1]
            }
        }
    }
}

var studentSt = StudentSt(firstName: "Lo", lastName: "Traffalgar", dateOfBirth: StudentSt.DateOfBirth(year: 1990, month: .feb, day: 8))
studentSt.firstName
studentSt.firstName = "bOB"
studentSt.firstName
studentSt.fullName = "ARIA sTark"
studentSt.firstName
studentSt.lastName
studentSt.fullName
studentSt.age
studentSt.dateOfBirth.day = 33
studentSt.age
studentSt.yearsOfStudy


// 5. Создать структуру отрезок, у которой будут две внутрение структуры "точка". Структура отрезок содержит две точки А и В и это stored property, а так же два computed propertied, первое это midle point это точка между двумя точками А и В, второе длинна вашего отрезка.
// MARK: - Task №5

struct Cut {
    // struct Point
    struct Point {
        var x: Double
        var y: Double
    }
    // stored properties
    var a: Point
    var b: Point
    // computed properties
    var middlePoint: Point {
        get {
            return Point(x: (a.x + b.x) / 2, y: (a.y + b.y) / 2)
        }
        set(newCoord) {
            let (oldX, oldY) = (middlePoint.x, middlePoint.y)
            a.x = newCoord.x - (oldX - a.x)
            a.y = newCoord.y - (oldY - a.y)
            b.x = newCoord.x - (oldX - b.x)
            b.y = newCoord.y - (oldY - b.y)
        }
        
    }
    var length: Double {
        get {
            sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
        }
        set {
            let difLength = newValue - length
            let (oldX, oldY) = (b.x, b.y)
            b.x = oldX + (oldX - a.x) / length * difLength
            b.y = oldY + (oldY - a.y) / length * difLength
        }
        
    }
    
}
var someCut = Cut(a: Cut.Point(x: 1, y: 3), b: Cut.Point(x: 4, y: 5))
someCut.middlePoint
someCut.middlePoint = Cut.Point(x: 4, y: 5)
someCut.a
someCut.b
someCut.length
someCut.length = 4
someCut.b
someCut.middlePoint





/*
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

*/








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
