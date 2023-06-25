//: [Previous](@previous)

import Foundation

// MARK: Tuples (кортежи)
// Tuples - тип данных который групирует другие типы в один составной тип данных
// основное предназначение кортежей, это возврат из функции
// кортежи создаются на короткое время (полочули, разобрали и забыли)

let simpleTuple: (Int, String, Bool, Double) = (1, "Hello", true, 2.3)
print(type(of: simpleTuple))

// decompose (разложение/развязывание)
let (number, greatings, check, decimal) = simpleTuple

number
greatings
check
decimal

simpleTuple.0
simpleTuple.1
simpleTuple.2
simpleTuple.3

let (_, _, chek2, _) = simpleTuple
chek2

var tuple = (index: 1, phrase: "Hello", registered: true, latency: 2.3)
tuple.index
tuple.phrase
tuple.registered
tuple.latency

// change tuple's value
tuple.index = 2

let a = (x: 1, y: 2)
var b = (x: 2, y: 3)

b = a
b
/*
let ewdColor = "red"
let greenColor = "green"
let clueColor = "Blue"
*/

let (red, green, blue) = ("red", "green", "blue")
red
green
blue

let totalNumber = 5
let merchantName = "Alex"

print("\(totalNumber) \(merchantName)")
print((totalNumber, merchantName))




//: [Next](@next)
