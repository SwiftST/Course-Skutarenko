//: [Previous](@previous)

import Foundation

// MARK: Optional types

// В swift, nil - это отсутствие значения определенного типа (т.е. подразумевается что данных нет)

/*
 server request
 is it Saturday?
 
 true / false / nil
 */

var apples: Int? = 5
// apples + 1 // mistake
// apples = nil

if apples == nil {
    print("nill apples")
} else {
    // print(apples!)
    // force unwrapping (вынужденное разворачивание)
    let a = apples! + 2
}
// когда мы собираемся делать force unwrapping, всегда требуется проверять значение на nil

// Optional binding (приявязка опционала)
if var number = apples {
    number += 2
}

let age = "20"

if Int(age) != nil {
    let ageNumber = Int(age)!
}

if let ageNumber = Int(age) {
    print(ageNumber)
}

// MARK: Implicit unwrap optional type (Int!, String!)
// Если существует ситуация, когда значение переменной вначале будет nil, но мы точно знаем что не будем его использовать до тех пор пока в нем не появится какое то значение (например Int, String) и после этого оно будет всегда не nil. Возможно использовать Implicite unwrap optional type (Int!, String!)

var apples2: Int! = nil

apples2 = 2
assert(apples2 != nil, "oh no!!!")
apples2 += 5

// утвержения (assert) в основном применяются при написании собыственных фреймворков









let someAge = Int(age)




















//: [Next](@next)
