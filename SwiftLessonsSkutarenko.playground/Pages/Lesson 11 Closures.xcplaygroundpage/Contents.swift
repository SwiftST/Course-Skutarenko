//: [Previous](@previous)

import Foundation

// MARK: Closures (TODO, FIXME)

// MARK: Note
// TODO: Do it
// FIXME: fix it

let numbers = [4, 3, 12, 7, 6, 3, 56, 7, 8, 9, 10, 4, 3, 1, 8, 11]

func filterArray(numbers: [Int], closure: (Int) -> Bool) -> [Int] {
    var filtered: [Int] = []
    for number in numbers {
        if closure(number) {
            filtered.append(number)
        }
    }
    return filtered
}
/*
func compare(number: Int) -> Bool {
    number % 2 == 0
}
*/
filterArray(numbers: numbers) { number in
    number % 2 == 0
}
filterArray(numbers: numbers) { number in
    number % 2 == 1
}
filterArray(numbers: numbers) { number in
    number % 3 == 0
}

filterArray(numbers: numbers) { $0 % 3 == 0 }

let numbersTwo = [1, 2, 3, 5, 7, 123]

var count = 0

let a4 =
filterArray(numbers: numbers) { value in
    for include in numbersTwo /* захват из контекста*/ {
        count += 1
        if include == value {
            return true
        }
    }
    return false
}
count
count = 0
let someSet = Set(numbersTwo)
let a5 = filterArray(numbers: numbers) { value in
    count += 1
    return someSet.contains(value)
}
count




//: [Next](@next)
