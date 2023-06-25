import UIKit

// 1. Используя print красиво вывести диапазоны базовых типов данных (Int8, UInt8 и т.д.)

print("Диапазон Int8: \(Int8.min...Int8.max)")
print("Диапазон UInt8: \(UInt8.min...UInt8.max)")
print("Диапазон Int: \(Int.min...Int.max)")
print("Диапазон UInt: \(UInt.min...UInt.max)")

// 2. Создать три константы - Int, Float, Double. Все три числа должны быть разные, но не ноль. Создать еще три константы - первая является суммой всех трех, результат Int, вторая сумма всех трех результат Double, третья сумма всех трех результат Float
let valueInt = 12
let valueFloat: Float = 13
let valueDouble = 2.1

let sumInt = valueInt + Int(valueFloat) + Int(valueDouble)
let sumFloat = valueFloat + Float(valueInt) + Float(valueDouble)
let sumDouble = valueDouble + Double(valueInt) + Double(valueFloat)

// 3. Создать условие, если результат  Int меньше чем результат Double то вывести на консоль "Double точнее", а если ее результат оказался меньше то можно вывести все что угодно

if Double(sumInt) < sumDouble {
    print("Double точнее")
} else {
    print("Int тоже точен")
}
