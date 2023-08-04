//: [Previous](@previous)

import Foundation

// MARK: Properties
// Stored properties - свойства хранения, сохраняют значения и мы можем узнать что будет сохранено в момент его изсенения с помощью обсерверов и если что его подправить
// Computed properties - вычисляемые свойства. Не сохраняют значения в себя, они используют другие переменные чтобы туда сохранять и чтобы брать информацию и выдавать ее

// MARK: Stored properties
// У свойств хранения есть обсерверы, которые позволяют узнать что происходит прямо перед установкой значения свойству (willSet) и сразу после установки (didSet)
// didSet позволяет изменять значение вашего свойства

struct Student {
    var firstName: String {
        willSet(newValue) {
            print("will set " + newValue + " instead of " + firstName)
        }
        didSet(oldValue) {
            print("did set " + firstName + " instead of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet(oldValue) {
            print("did set " + lastName + " instead of " + oldValue)
            lastName = lastName.capitalized
        }
    }
    var age: Int {
        didSet {
            if age < 0 {
                age = oldValue
                print("Возраст не может быть отрицательным")
            }
        }
    }
    // Computed property
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set(newValue) {
            print("full name wants to be set to " + newValue)
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
       
    }
    var lifeStage: String {
        switch age {
        case 0...2:
            return "baby"
        case 3...13:
            return "child"
        case 14...17:
            return "teenager"
        case 18...23:
            return "Student"
        case 24...50:
            return "adult"
        case 51...100:
            return "old man"
        default:
            return "Highlander"
        }
    }
    
}
var student = Student(firstName: "Alex", lastName: "Teacher", age: 30)

student.firstName
student.lastName
student.fullName
student.firstName = "Bob"
student.fullName = "IVAn IVAnov"
student.firstName
student.lastName
student.fullName
student.age = -1
student.age
student.lifeStage

// Stored property - сохраняет данные непосредственно в самой property

// MARK: Computed property

// сеттеры - устанавливают значение вашему свойству
// геттеры - считывают значение вашего свойства











//: [Next](@next)
