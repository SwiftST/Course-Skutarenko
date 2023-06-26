//: [Previous](@previous)

import Foundation

// MARK: Optional types
/*
1. Создать 5 строковых констант. Найти их сумму привидя их к Int. Использовать два метода Optional binding and Force Unwraping
2. Получаем ответ от сервера в виде кортежа (statusCode: Int, message: String?, errorMessge: String?). Если statusCode в диапазоне 200..<300, тогда вывести на консоль message, eсли в другом диапазоне то вывести на консоль errorMessage.
Создать еще один tuple как во втором задании только без statusCode. Одно из значений (message or errorMessage) всегда содержит какое то значение, нужно разобраться какое из них содержит значение и вывести эту строку
3. Создайте 5 тюплов с тремя параметрами:
имя, номер машины, оценка за контрольную при создании этих тюплов не должно быть никаких данных после создания каждому студенту установите имя некоторым установите номер машины некоторым установите результат контрольной выведите в консоль:
    - имена студента
    - есть ли у него машина
    - если да, то какой номер
    - был ли на контрольной
    - если да, то какая оценка
*/


// 1
let strOne = "ad"
let strTwo = "11"
let strThree = "1s"
let strFour = "18"
let strFive = "9"
var sum = 0

if Int(strOne) != nil {
    sum += Int(strOne)!
}
if let temp = Int(strTwo) {
    sum += temp
}
if Int(strThree) != nil {
    sum += Int(strThree)!
}
if let temp = Int(strFour) {
    sum += temp
}
if Int(strFour) != nil {
    sum += Int(strFour)!
}
print("Sum equal - \(sum)")

// 2

var serverResponse: (Int, String?, String?) = (200, "ОК", "Error")
var (statusCode, message, errorMessage) = serverResponse

if 200..<300 ~= statusCode {
    print(message ?? "Ok")
} else {
    print(errorMessage ?? "nil")
}

var (_, messageTwo, errorMessageTwo) = serverResponse
messageTwo = nil
errorMessageTwo = nil

if let message = messageTwo {
    print(message)
} else if let error = errorMessageTwo {
    print("Error")
} else {
    "both nil"
}

// 3

var studentOne: (name: String, carNumber: Int?, controlScore: Int?)
var studentTwo: (name: String, carNumber: Int?, controlScore: Int?)
var studentThree: (name: String, carNumber: Int?, controlScore: Int?)
var studentFour: (name: String, carNumber: Int?, controlScore: Int?)
var studentFive: (name: String, carNumber: Int?, controlScore: Int?)

studentOne = ("Pavel", 200, nil)
studentTwo = ("Ron", nil, 2)
studentThree = ("Sergey", 100, 3)
studentFour = ("Darya", 200, 5)
studentFive = ("Misha", nil, 4)
let students = [studentOne, studentTwo, studentThree, studentFour, studentFive]

print("Students list:")
for (index, student) in students.enumerated() {
    var str = "\(index + 1).  Name: \(student.0).\n\t"
    if let numberCar = student.carNumber {
        str += "Car: The student has a car. Its number is \(numberCar).\n\t"
    } else {
        str += "Car: The student doesn't have a car.\n\t"
    }
    if let controlScore = student.controlScore {
        str += "Last test: The student was on the last test. His control score is \(controlScore)"
    } else {
        str += "Last test: The student was not on the last test "
    }
    print(str)
}

//: [Next](@next)
