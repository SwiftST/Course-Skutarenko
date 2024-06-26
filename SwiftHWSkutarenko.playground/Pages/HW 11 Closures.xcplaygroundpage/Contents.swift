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
func getNumber(in numbers: [Int], closure: (Int?, Int) -> Bool) -> Int {
    var result = !numbers.isEmpty ? numbers[0] : nil
    for number in numbers {
        result = closure(result, number) ? number : result
    }
    return result ?? 0
}
let minOne = getNumber(in: numbers) {
    $0 == nil || $0! > $1
}

let maxOne = getNumber(in: numbers) {
    $0 == nil || $0! < $1
}

// 2
let someString = "asbdsjvbsnvjksndv123 #$%^ hsdhcvsJDBJCVB"
func getChar(in string: String, closure: (String?, String) -> Bool) -> String {
    var result = !string.isEmpty ? String(string.first!) : nil
    for char in string {
        result = closure(result, String(char)) ? String(char) : result
    }
    return result ?? ""
}

let minChar = getChar(in: someString) {
    $0 == nil || $0! > $1
}
    
let maxChar = getChar(in: someString) {
    $0 == nil || $0! > $1
}


// 4. Создать произвольную строку преобразовать ее в массив [String] каждая строка - один символ. Испольуя метод sorted отсортировать этот массив так чтобы сначала шли гласные в алфавитном порядке, потом согласные в алфавитном порядке, потом цифры, а потом символы

var letters: [String] = []
for char in someString {
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
