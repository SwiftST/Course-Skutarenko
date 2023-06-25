import UIKit

//let bigNumber = 1_835_353_553_211

let decimalNumber = 25
let octalNumber = 0o31
let binaryInteger = 0b0001_1001
let nexadecimal = 0x19

let number: UInt8 = 255

Int.min
Int8.max
UInt8.min
UInt8.max

// Float - 32 битное число с плавающей запятой (точность 6 разрядов после запятой)
// Double - 64 битное число с плавающей запятой (точность 15 разрядов после запятой)

// экспонента для десятичных чисел с плавающей точкой
13.3123e-2

// экспонента для шестнадцатичричных чисел с плавающей точкой
0x5p-2
/*
let a = 5
let b = 5.0

let c = a + Int(b)
*/

/*
let a = 5
let b = 5.9

let c = Double(a) + b
*/

//let c = 5 + 5.9

/*
let a = 5.0
let b = 5.2

let c = a + b
*/

// псевдоним типа
typealias MyNumber = Int

let a: MyNumber = 5
let b = 5.2

let c = a + Int(b)

let d = false

if d {
    print("Hi")
} else {
    print("Bye!")
}
