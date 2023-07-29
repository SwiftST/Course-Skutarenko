//: [Previous](@previous)

import Foundation

// MARK: Closures

// 1. Написать функцию которая ничего не возвращает, принимает один клоужер, который ничего не принимает и ничего не возвращает. Добавить в тело цикл for-in 1...10 в теле цикла сделать print с выводом итераций, после выхода из цикла вызвать closure, в самом клоужере добавить какой то код (print). Попрактиковаться с вызовом клоужера

func someFunction(closure: () -> ()) {
    closure()
    var sum = 0
    for i in 1...10 {
        print(i)
        sum += i
    }
    closure()
}
someFunction {
    print("sum = ")
}

// 2. Создать массив [Int] отсортировать его с помощью метода sorted по возрастанию и по убыванию

var numbers = [1, 33, 21, 4, 22, 65, 104, 44]
numbers.sorted { $0 > $1 }
numbers.sorted(by: < )

// 3. Написать функцию которая прнимает [Int] и closure (Int?, Int) -> Bool и возвращает Int. В функции создать optional переменную и цикл, пройтись в цикле по массиву [Int] каждый раз вызывая closure с оцпциональным значением и значением массива. Вернуть максимальный и минимальный элементы массива.
// Сделать то же самое только для тсроки и символов найти миниммальный и максимальный символ в строке по скалярному значению

// 1
func getInt(numbers: [Int], closure: (Int, Int?) -> Bool) -> Int! {
    guard !numbers.isEmpty else {
        return nil
    }
    var optional: Int? = numbers[0]
    for number in numbers {
        optional = closure(number, optional) ? number : optional
    }
    return optional
}

let min = getInt(numbers: numbers) { $0 < $1! }
let max = getInt(numbers: numbers) { $0 > $1! }

// 2
let someSting = "asbdsjvbsnvjksndv123"
let char: Character = "a"



func getChar(in string: String, closure: (String, String) -> Bool) -> String {
    guard !string.isEmpty else {
        return ""
    }
    var str = String(string.first!)
    for char in string {
        str = closure(String(char), str) ? String(char) : str
    }
    return str
}
let minChar = getChar(in: someSting) { $0 < $1 }
let maxChar = getChar(in: someSting) { $0 > $1 }

// 4. Создать произвольную строку преобразовать ее в массив [String] каждая строка - один символ. Испольуя метод sorted отсортировать этот массив так чтобы сначала шли гласные в алфавитном порядке, потом согласные в алфавитном порядке, потом цифры, а потом символы

let string = "Hello! My name is Pavel. I'm from Russia. I'm 32 years old. I'm married to Darya. We live in Kemerovo city. I work north. I want to become a programmer."
var letters: [String] = []
for char in string {
    letters.append(String(char))
}

//letters.sorted(by: > )

func priority(letter: String) -> Int {
    switch letter.lowercased() {
    case "a", "e", "i", "o", "u", "y":
        return 1
    case "a" ... "z":
        return 2
    case "0" ... "9":
        return 3
    default:
        return 4
    }
}
let sortedArray = letters.sorted { one, two in
    if priority(letter: one) < priority(letter: two) {
        return true
    } else if priority(letter: one) > priority(letter: two) {
        return false
    } else {
        return one.lowercased() < two.lowercased()
    }
}
print(sortedArray)
//: [Next](@next)
