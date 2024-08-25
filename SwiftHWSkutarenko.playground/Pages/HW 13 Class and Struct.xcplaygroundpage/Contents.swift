//: [Previous](@previous)

import Foundation

// MARK: Classes and Structures

// 1. Создать структуры Student у которого будет имя, фамилия, год рождения и средний бал оценок. Сделать несколько экземпляров положить их в массив с именем журнал.

struct StudentSt {
    var name: String
    var surname: String
    var yearOfBirth: Int
    var averageScore: Double
}
var studentOneSt = StudentSt(name: "Leo", surname: "Norman", yearOfBirth: 1999, averageScore: 3.2)
var studentTwoSt = StudentSt(name: "Fil", surname: "Norman", yearOfBirth: 2001, averageScore: 4.1)
var studentThreeSt = StudentSt(name: "Bill", surname: "Colins", yearOfBirth: 1978, averageScore: 3)
var studentSt = [studentOneSt, studentTwoSt, studentThreeSt]

// 2. Создать функцию принимающую массив и выводит в консоль данные студента перед каждым студентом ставить номер по списку (начиная с 1).

func printStudentsSt(from students: [StudentSt]) {
    for (i, student) in students.enumerated() {
        print("\(i + 1). Name: \(student.name), Surname: \(student.surname), birth year: \(student.yearOfBirth), average score: \(student.averageScore)")
    }
    print("")
}
printStudentsSt(from: studentSt)


// 3. Используя функцию sorted(by:) отсортировать массив по среднему балу по убыванию и распечатать весь массив.

printStudentsSt(from: studentSt.sorted { $0.averageScore > $1.averageScore })

// 4. Отсортировать массив по возрастанию фамилии и если фамилии одинаковы тогда сортировать по имени, распечатать еще раз.

printStudentsSt(from: studentSt.sorted {
    $0.surname == $1.surname ? $0.name < $1.name : $0.surname < $1.surname
})

// 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var someStudentSt = studentSt
someStudentSt[0].name = "Jim"
someStudentSt[1].name = "Julia"
someStudentSt[2].name = "Ron"

printStudentsSt(from: someStudentSt)
printStudentsSt(from: studentSt)

// Исходный массив не изменится, так как мы имеем дело c Value type, когда мы создаем новый массив студентов, присваивая исходный массив создается копия, изменяя которую мы никак не влияем на исходный массив

// 6. Теперь проделайте все тоже самое для класса. Какой результат в 5м задании? Что изменилось и почему?

// 1. Создать структуры Student у которого будет имя, фамилия, год рождения и средний бал оценок. Сделать несколько экземпляров положить их в массив с именем журнал.

class StudentCl {
    var name: String
    var surname: String
    var birthOfYear: Int
    var averageScore: Double
    
    init(_ name: String, _ surname: String, _ birthOfYear: Int, _ averageScore: Double) {
        self.name = name
        self.surname = surname
        self.birthOfYear = birthOfYear
        self.averageScore = averageScore
    }
}

var studentOneCl = StudentCl("Ron", "Uizly", 1991, 3.1)
var studentTwoCl = StudentCl("Mihail", "Cat", 1967, 4.2)
var studentThreeCl = StudentCl("Bob", "Cat", 1989, 2.3)
var studentsCl = [studentOneCl, studentTwoCl, studentThreeCl]

// 2. Создать функцию принимающую массив и выводит в консоль данные студента перед каждым студентом ставить номер по списку (начиная с 1).

func printStudentsCl(_ students: [StudentCl]) {
    for (i, student) in students.enumerated() {
        print("\(i + 1). Name: \(student.name), Surname: \(student.surname), Year birth: \(student.birthOfYear), Average score: \(student.averageScore)")
    }
    print("")
}
printStudentsCl(studentsCl)

// 3. Используя функцию sorted(by:) отсортировать массив по среднему балу по убыванию и распечатать весь массив.

printStudentsCl(studentsCl.sorted { $0.averageScore > $1.averageScore })

// 4. Отсортировать массив по возрастанию фамилии и если фамилии одинаковы тогда сортировать по имени, распечатать еще раз.

printStudentsCl(studentsCl.sorted { $0.surname == $1.surname ? $0.name < $1.name : $0.surname < $1.surname })

// 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

// Данные не изменятся, так как мы создадим ссылку на уже существующий объект, изменяя какой либо экземпляр результирующего массива будут изменяться данные как в исходном массиве, так и в самих экземплярах класса входящих в состав массива

var someStudentsCl = studentsCl
someStudentsCl[0].name = "Friday"
someStudentsCl[1].surname = "Wednesday"
someStudentsCl[2].averageScore = 9999

printStudentsCl(someStudentsCl)
printStudentsCl(studentsCl)

someStudentsCl[0] === studentsCl[0]
someStudentsCl[0] === studentOneCl
studentTwoCl === someStudentsCl[1]



// 7. Сделать домашнее задание по энумам используя структуры или классы



//: [HW 13 Task 7](@next)

