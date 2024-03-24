//: [Previous](@previous)

import Foundation

/* SWIFT - 06. Строки

 1. Выполните задание 1 урока о базовых операторах: /skuter04
 только вместо forced unwrapping и optional binding используйте оператор ??

 / Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквыю Найти сумму всех этих констант приведя их к Intю (Используйте и optional binding и forced unwrapping)/

 Когда посчитаете сумму, то представьте свое выражение в виде строки
 Например: 5 + nil + 2 + 3 + nil = 10

 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
*/

let strOne = "1"
let strTwo = "11"
let strThree = "1s"
let strFour = "18"
let strFive = "9"
var sum = 0
var result = ""
let stringInt = [strOne, strTwo, strThree, strFour, strFive]

for (index, string) in stringInt.enumerated() {
    sum += Int(string) ?? 0
    if index == 0, Int(string) != nil {
        result += String(sum)
    } else if index == 0, Int(string) == nil {
        result += "nil"
    } else if Int(string) != nil {
        result += " + \(Int(string)!)"
    } else {
        result += " + nil"
    }
}
result += " = \(sum)"
print(result)




/*
 2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов,
 можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C
*/


let a = "a"

var b = UnicodeScalar("💻")
("\u{1F4BB}" as NSString).length // такой метод выводит количество символов, согласно занятой памяти, что не соответствует реальности
"💻".count
"\u{1F4BB}"
"⌚️"
"⌨️"
"🏔️"
"🧘🏻‍♂️"



/*
 3. Создайте строку английский алфавит, все буквы малые от a до z

 задайте константу - один из символов этого алфавита

 Используя цикл for определите под каким индексов в строке находится этот символ
 */

UnicodeScalar("a")
UnicodeScalar("z")

let convertArray = Array(97...122).map { a in
    Character(UnicodeScalar(a)!.escaped(asASCII: true))
}
var alphabet = String(convertArray)
let searchSymbol: Character = "k"

for (index, char) in alphabet.enumerated() {
    if char == searchSymbol {
        print("Символ \(char) находится под индексом \(index)")
        break
    }
}







//: [Next](@next)
