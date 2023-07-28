//: [Previous](@previous)

import Foundation

// 1. Создать пару функций с короткими именами которые будут возвращать строку с каким то символом. Распечатать их в одном принте
func printPanda() -> String {
    "🐼"
}
func printBamboo() -> String {
    "🎋"
}
func printForest() -> String {
    "🌳"
}
print(printPanda() + " eats " + printBamboo() + " in " + printForest())


// 2. Реализовать функцию которая будет принимать два параметра строка и символ - например "a" 5 которая будет выводить строку белая или черная. Присвоить эту функцию строке и распечатать

func getColor(coordX: String, coordY: Int) -> String {
    guard coordX.count == 1, "abcdefgh".contains(Character(coordX)), 1...8 ~= coordY else {
        return "Недопустимый адрес ячейки"
    }
    let answer = (Character(coordX).asciiValue! + UInt8(coordY)) % 2 != 0
    return answer ? "white" : "black"
}
getColor(coordX: "aa", coordY: 8)
let color = getColor
print("Color is " + color("b", 3))

// 3. Создать массив и создать две функции одна которая будет принмать массив другая вариативный параметр и возвращать массив в обратном порядке. Функция которая принимает sequence должна вызвать функцию которая принимает массив

let someArray = [2, 3, 4, 5, 22, 11, 44]
func reverseArray(array: [Int]) -> [Int] {
    var numbers: [Int] = []
    for number in array {
        numbers.insert(number, at: 0)
    }
    return numbers
}
reverseArray(array: someArray)
func reverseArray(sequence: Int...) -> [Int] {
    reverseArray(array: sequence)
}
reverseArray(sequence: 1, 2, 4, 55, 2)

// 4. Сделать тоже самое что и в третьем задании только вместо возврата использовать inout параметры. (что будет если убрать inout, изменится ли массив)
var numbers = [33, 45, 3, 11, 66]
func reverseArray(array: inout [Int]) {
    array = reverseArray(array: array)
}
reverseArray(array: &numbers)
numbers

// 5. Создать функцию, которая будет принимать строку и она будет возвращать строку, в которой все знаки препинания будут убраны, все гласные переведены в заглавные, все согласные переведены в строчные, а цифры изменены на слова (применить switch)

let string = "Hello! My name is Pavel. I'm from Russia. I'm 32 years old. I'm married to Darya. We live in Kemerovo city. I work north. I want to become a programmer."

func convertString(text: String) -> String {
    func convertNumber(number: Character) -> String {
        let numbers: [Character: String] = [
        "1": "OnE",
        "2": "twO",
        "3": "thrEE",
        "4": "fOUr",
        "5": "fIvE",
        "6": "sIx",
        "7": "sEvEn",
        "8": "EIght",
        "9": "nInE",
        "0": "zErO"
        ]
        return numbers[number]!
    }
    var result = ""
    for char in text {
        switch char.lowercased() {
        case "a", "e", "i", "o", "u", "y":
            result.append(char.uppercased())
        case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m":
            result.append(char.lowercased())
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
            result.append(convertNumber(number: char))
        case " ":
            result += " "
        default:
            result += ""
        }
    }
    return result
    
}
convertString(text: string)

// рекурсия - функция которая вызывает сама себя
// первое что нужно сделать - определиить точку выхода
// пример с факториалом числа

// 3! = 1 * 2 * 3

func fact(number: Int) -> Int {
    if number <= 1 {
        return 1
    }
    
    var f = 1
    for i in 2...number {
        f *= i
    }
    return f
}

fact(number: 3)

func factTwo(number: Int) -> Int {
    if number <= 1 {
        return 1
    }
    
    return number * factTwo(number: number - 1)
}

factTwo(number: 4)




//: [Next](@next)
