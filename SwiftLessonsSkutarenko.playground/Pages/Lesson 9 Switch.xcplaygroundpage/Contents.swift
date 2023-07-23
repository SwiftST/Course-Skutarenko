//: [Previous](@previous)

import Foundation



mainLoop: for _ in 0...1000 {
    for i in 0..<20 {
        if i == 10 {
            break mainLoop
        }
        print(i)
    }
}

let age = 61
var name = "Alex"

switch age {
case 0...16:
    fallthrough
case 17...21:
    print("студент")
case 22...50:
    print("зрелость")
case 52:
    print("не сработало")
case 51, 56, 57:
    print("сработало")
default:
    break
}

switch name {
case "Alex" where age < 50:
    print("Hi buddy")
case "Alex" where age >= 50:
    print("I don't know you")
default:
    break
}

let tuple = (name, age)

switch tuple {

case ("Alex", 60):
    print("Hi alex 60")
case ("Alex", 59):
    print("Hi alex 59")
case (_, let number) where number >= 65 && number <= 70:
    print("Hi old man")
    
case ("Alex", _):
    print("Hi Alex")
default:
    break
}

var optional: Int? = 5

if let a = optional {
    print("\(a) != nil")
}

let point = (5, 5)

switch point {
case let (x, y) where x == y:
    print("x == y")
case let (x, y) where x == -y:
    print("x == -y")
case (_, let y) where y < 0:
    print("y < 0")
default:
    break
}

let array: [CustomStringConvertible] = [5, 5.6, Float(5.5)]

switch array[1] {
case _ as Int:
    print("Int")
case _ as Float:
    print("Float")
case _ as Double:
    print("Double")
default:
    break
}


//: [Next](@next)
