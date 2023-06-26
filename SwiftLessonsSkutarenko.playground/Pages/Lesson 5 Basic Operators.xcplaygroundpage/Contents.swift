//: [Previous](@previous)

import Foundation

// MARK: Basic Operators

// Операторы бывают трех типов
// 1. Унарные - префиксные или постфиксные операторы, применяются к одному операнду
// 2. Бинарные (инфиксные - оператор внутри) - применяются к двум операндам, ставятся между ними
// 3. Тернарый условный оператор - короткая запись оператора if else



let total = 5 + 6 - 8 * 3 - 5 / 10

let div = 10 / 3
let rest = 13 % 3


var small: UInt8 = 0xff

small &+= 5

// переполнение - выход за границы допустимых значений числового типа данных
// для борьбы с переполнением можно использовать & перед арифметическим оператором &+, &-, &/, &*, &%

// конкатенация строк
let str = "Hi, " + "there!"

// Операторы сравнения: >, <, >=, <=, ==, !=, ===, !==

let a = 6
let b = 2

if a != b {
    print("yes")
} else {
    print("no")
}

var c: Int

/*
if a > b {
    c = a
} else {
    c = b
}
*/

// Тернарный условный оператор
c = a < b ? a : b

let text = "123"

let n = Int(text)
/*
if n != nil {
    c = n!
} else {
    c = 0
}
*/

/*
if let opt = n {
    c = opt
} else {
    c = 0
}
*/

c = n ?? 0

var sum = 5
sum = sum + 1
sum += 1


// Унарные операторы

var good = true
good = !good
good

//логические операторы
// У логического оператора И &&(*) приоритет выше чем у ИЛИ ||(+)
// && = *, || = +, !

if good  {
    print("good")
} else {
    print("bad")
}

// && = *
true && true // 1 * 1
true && false // 1 * 0
false && true // 0 * 1
false && false // 0 * 0

// || = +
true || true // 1 + 1
true || false // 1 + 0
false || true // 0 + 1
false || false // 0 + 0

let i = 5
let j = 6
let k = 7
let m = 8

if i < 3 && j > k && m != k || m > i {
    
}

// Range
0...5
0..<5

for i in 0..<5 {
    print(i)
}












//: [Next](@next)
