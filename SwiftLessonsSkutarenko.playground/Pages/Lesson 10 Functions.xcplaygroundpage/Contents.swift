//: [Previous](@previous)

import Foundation

// DRY - Don't repeat yourself - принцип программирования, не повторяться

func calculateMoney(inWallet wallet: [Int], _ type: Int? = nil) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0

    for value in wallet {
        if (type == nil) || (type! == value) {
            count += 1
            sum += value
        }
       
    }
    return (sum, count)
}

// вариативные параметры размещаются в конце списка объявляемых параметров
func calculateMoney(inSequince sequence: Int...) -> Int {
    var sum = 0
    for number in sequence {
        sum += number
    }
    return sum
}

let wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

var (money, count) = calculateMoney(inWallet: wallet, 1)

calculateMoney(inWallet: wallet, 100).count

calculateMoney(inSequince: 2, 32, 3, 32, 22, 55)


func sayHi() -> () {
    print("Hi")
}
sayHi()
let hi/*: () -> ()*/ = sayHi
hi()

func sayPhrase(phrase: String) -> Int? {
    print(phrase)
    return phrase.count
}
sayPhrase(phrase: "aaa")
let phrase: (String) -> (Int?) = sayPhrase
phrase("bbb")

func doSomething(whatToDo: () -> ()) {
    whatToDo()
}
doSomething(whatToDo: hi)

func whatToDo() -> () -> () {
    func printSomething() {
        print("Hello world!!!")
    }
    return printSomething
}

let iShouldDoThis = whatToDo()
iShouldDoThis()


//: [Next](@next)
