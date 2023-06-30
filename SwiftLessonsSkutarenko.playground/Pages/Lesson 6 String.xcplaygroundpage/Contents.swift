//: [Previous](@previous)

import Foundation

// MARK: Строки
// Строка - упорядоченный набор символов (скалярных юникод значений)
// Один юникод символ - это 21-битное число (2 байта и 5 бит)
// Юникод - определенный формат представления символов

var str = ""
str += "a"

var a = 5
var b = a

a += 1
b

var str1 = "a"
var str2 = str1

str1
str2

//str1 = ""

str1
str2

str1.isEmpty

let char1: Character = "x"

for char in "Hello world!" {
    print(char)
}

str1.append(char1)

//(str1 as NSString).length
//NSString(string: str1).length


let heart =  "\u{1F496}"

let eAcute: Character = "\u{E9}"
let combinateEAcute: Character = "e\u{301}"

let fun: Character = "x\u{301}\u{20dd}"

let funString = "what is this? -> \(fun)"

funString
funString.count
(funString as NSString).length

if funString == "aa" {
    
} else {
    print("not equal")
}

funString.hasPrefix("what")
funString.hasSuffix("x\u{301}\u{20dd}")



















//: [Next](@next)
