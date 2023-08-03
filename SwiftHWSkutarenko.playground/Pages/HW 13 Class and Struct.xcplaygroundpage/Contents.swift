//: [Previous](@previous)

import Foundation

// MARK: Classes and Structures

// 1. Создать структуры Student у которого будет имя, фамилия, год рождения и средний бал оценок. Сделать несколько экземпляров положить их в массив с именем журнал.

struct Student {
    var name: String
    var surname: String
    var yearOfBirth: Int
    var averageScore: Double
}
var magazineStruct: [Student] = []

var stStruct1 = Student(name: "Petr", surname: "Petrov", yearOfBirth: 1992, averageScore: 3.4)
var stStruct2 = Student(name: "Ivan", surname: "Ivanov", yearOfBirth: 1988, averageScore: 4.1)
var stStruct3 = Student(name: "Roman", surname: "Ivanov", yearOfBirth: 1991, averageScore: 4.2)

magazineStruct = [stStruct1, stStruct2, stStruct3]

// 2. Создать функцию принимающую массив и выводит в консоль данные студента перед каждым студентом ставить номер по списку (начиная с 1).

func printStudents(for students: [Student]) {
    for (i, student) in students.enumerated() {
        print("\(i + 1). \(student.name) \(student.surname), year of birth: \(student.yearOfBirth), average score: \(student.averageScore)")
    }
    print("")
}
printStudents(for: magazineStruct)

// 3. Используя функцию sorted(by:) отсортировать массив по среднему балу по убыванию и распечатать весь массив.

magazineStruct = magazineStruct.sorted { $0.averageScore > $1.averageScore
}
printStudents(for: magazineStruct)

// 4. Отсортировать массив по возрастанию фамилии и если фамилии одинаковы тогда сортировать по имени, распечатать еще раз.

magazineStruct = magazineStruct.sorted { one, two in
    one.surname == two.surname ? one.name < two.name : one.surname < two.surname
}
printStudents(for: magazineStruct)


// 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var someMagazine = magazineStruct
someMagazine[0].name = "Julia"
someMagazine[1].yearOfBirth = 999
someMagazine[2].averageScore = 1000

printStudents(for: someMagazine)
printStudents(for: magazineStruct)

// Исходный массив не изменится, так как мы имеем дело c Value type, когда мы создаем новый массив студентов, присваивая исходный массив создается копия, изменяя которую мы никак не влияем на исходный массив

// 6. Теперь проделайте все тоже самое для класса. Какой результат в 5м задании? Что изменилось и почему?

// 1. Создать структуры Student у которого будет имя, фамилия, год рождения и средний бал оценок. Сделать несколько экземпляров положить их в массив с именем журнал.

class StudentClass {
    var name: String
    var surname: String
    var yersOfBirth: Int
    var averageScore: Double
    
    init(_ name: String, _ surname: String, _ years: Int, _ score: Double) {
        self.name = name
        self.surname = surname
        yersOfBirth = years
        averageScore = score
    }
}

let stClass1 = StudentClass("Vasiliy", "Petrov", 1988, 2.6)
let stClass2 = StudentClass("Genadiy", "Petrov", 1976, 4.6)
let stClass3 = StudentClass("Viktoria", "Secret", 1989, 4.1)

var students = [stClass1, stClass2, stClass3]

// 2. Создать функцию принимающую массив и выводит в консоль данные студента перед каждым студентом ставить номер по списку (начиная с 1).

func printStudents(_ students: [StudentClass]) {
    for (i, student) in students.enumerated() {
        print("\(i + 1). \(student.name) \(student.surname), year of birth: \(student.yersOfBirth), average score: \(student.averageScore)")
    }
    print("")
}
printStudents(students)

// 3. Используя функцию sorted(by:) отсортировать массив по среднему балу по убыванию и распечатать весь массив.

students = students.sorted { $0.averageScore < $1.averageScore }
printStudents(students)

// 4. Отсортировать массив по возрастанию фамилии и если фамилии одинаковы тогда сортировать по имени, распечатать еще раз.

students = students.sorted { one, two in
    one.surname == two.surname ? one.name < two.name : one.surname < two.surname
}
printStudents(students)

// 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

// Данные не изменятся, так как мы создадим ссылку на уже существующий объект, изменяя какой либо экземпляр результирующего массива будут изменяться данные как в исходном массиве, так и в самих экземплярах класса входящих в состав массива

var someStudents = students
someStudents[0].name = "Friday"
someStudents[1].surname = "Wednesday"
someStudents[2].averageScore = 9999

printStudents(someStudents)
printStudents(students)

someStudents[0] === students[0]
someStudents[0] === stClass2
stClass1 === someStudents[1]
stClass3 === students[2]

stClass2.name
stClass1.surname
stClass3.averageScore



// 7. Сделать домашнее задание по энумам используя структуры или классы



//: [HW 13 Task 7](@next)

