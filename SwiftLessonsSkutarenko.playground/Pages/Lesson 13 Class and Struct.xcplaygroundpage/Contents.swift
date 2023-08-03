//: [Previous](@previous)

import Foundation

// MARK: Classes and Structures
// Все наше приложение состоит из объектов классов и структур
/*
let student1 = (name: "Alex", age: 20)
let student2 = (name: "Bob", age: 22)

student1.name
student1.name

let student3 = (nam: "Sam", ag: 23)
student3.nam
*/

// Инструкция (класс) - говорит какие у вашего объекта должны быть свойства, методы их названия, что они делают, фактически это полностью объясняет поведение объекта и все данные которые в нем могут храниться

class StudentClass {
    // свойства класса
    var name: String
    var age: Int
    // пустой конструктор
    init() {
        name = "no name"
        age = 20
    }
    // параметрезированный конструктор
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct StudentStruct {
    var name: String
    var age: Int
}

func addOneYear(student: StudentClass) {
    student.age += 1
}

func addOneYear(student: inout StudentStruct) {
    student.age += 1
    print(student.age)
}

// Классы - это Reference type (ссылочный тип) то есть все происходит по ссылке.

let stClass1 = StudentClass(name: "Bob", age: 18)

stClass1.name = "Alex"
stClass1.age = 21

var stStruct1 = StudentStruct(name: "Sam", age: 18)

//stStruct.name = "Alex"
//stStruct.age = 21

stStruct1

// Структуры - это Value type, это означает что когда мы присваиваем один экземпляр структуры другому, то происходит копирование
var stStruct2 = stStruct1

stStruct2.age = 25
stStruct2.name = "Samuel"

stStruct1.name

addOneYear(student: &stStruct1)

stStruct1.age
stStruct2.age

let stClass2 = stClass1
stClass2.age = 20
stClass2.name = "AAA"

addOneYear(student: stClass1)

stClass1.age
stClass2.age

var arrayStructs = [stStruct1]
arrayStructs[0].age = 50
arrayStructs[0].age
stStruct1.age

var arrayClasses = [stClass1]
arrayClasses[0]
arrayClasses[0].age = 60
arrayClasses[0].age
stClass1.age


//: [Next](@next)
