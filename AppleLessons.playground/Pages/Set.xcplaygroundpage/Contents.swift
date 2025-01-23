//: [Previous](@previous)

import Foundation

// MARK: Множества (Set)
// Множества - неупорядоченная коллекция уникальных значений (не повторяются) одного типа

// MARK: Хэш значения для типа Set
/*
 Тип данных для множества должен быть хэшируемым (Hashable), т.е. должен предоставлять возможность для вычесления собственного хэша. Тип значения хэша Int должен быть для всех объектов одинаковым, чтобы можно было произвести сравнения если a == b, то и a.hashValue == b.hashValue
 Все базовые типы Swift (Int, Double, String, Bool) являются хэшируемыми по умолчанию и могут быть использованы в качестве значений множества или ключей Dictionary. Значения членов перечисления без каких либо связанных значений также являются хэшируемыми по умолчнию
 */

enum Example: String {
    case one
    case two
    case three
}

let one = Example.one

let someSet: Set<Example> = [.one, .two]

for i in someSet {
    if i.hashValue == one.hashValue {
        print(one.rawValue)
    }
}

// Возможно использовать свой собственный тип в качестве значения множества или ключа словаря, подписав его под протокол Hashable. Типы которые подписаны на протокол Hashable должны обеспечивать gettable свойство hashValue. Значение которое возвращает hashValue не обязательно должно иметь одно и тоже значение при выполнение одной и той же программы или разных программ.
// Так как протокол Hashable подписан под протокол Equatable, то подписанные под него типы так же должны предоставлять реализацию оператора равенства ==. Протокол Equatable требует любую реализацию оператора равенства для реализации возможности сравнения. Таким образом реализация оператора == должна удовлетворять следующим трем условиям, для всех трех значений a, b, c :
//    1. a == b (Рефлективность)
//    2. a == b значит b == a (Симметрия)
//    3. a == b && b == c значит a == c (Транзитивность)


// MARK: Синтаксис типа множества
// тип множества в Swift записывается как Set<Element>. Сокращенной формы записи у множества нет

// MARK: Создание и инициализация пустого множества
// C помщью синтаксиса инициализатора
var letters = Set<Character>()
print("letters имеет тип \(type(of: letters)) и \(letters.count) элементов")

// При помощи пустого литерала массива
let lettersTwo: Set<Character> = []

// MARK: Создание множества при помощи литерала массива

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
type(of: favoriteGenres)

// MARK: Доступ и изменение множества
// Получить доступ и модифицировать множества можно через свойтсва и методы

// кол-во элементов
print("I have \(favoriteGenres.count) favorite genres")

// пустое или нет (count == 0)
if favoriteGenres.isEmpty {
    print("What difference does it make to play?")
} else {
    print("I have definite preference")
}

// добавление нового элемента во множество
favoriteGenres.insert("Jazz")

// удаление одного элемента (возвращает удаленное значение или nil если оно отсутствует во множестве)
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it")
} else {
    print("I never much cared for that.")
}

// Наличие определенного элемента во множестве
favoriteGenres.contains("Jazz")

// MARK: Итерация по множеству

for genre in favoriteGenres {
    print(genre)
}

// множества не имеют определенного порядка. Для того чтобы проитерироваться по множеству в определенном порядке нужно использовать метод sorted(), который возвращает элементы в виде отсортированного массива, по умолчанию используя оператор <
for genre in favoriteGenres.sorted() {
    print(genre)
}

// MARK: Выполнение операций с множествами

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


// 1. Используйте метод union (_:) для создания нового множества состоящего из всех значений обоих множеств.
let unionSet = oddDigits.union(evenDigits)
for number in unionSet.sorted() {
    print(number, terminator: " ")
}
print("")

// 2. Используйте метод intersection(_:) для создания нового множества из общих значений двух входных множеств.
let intersectionSet = oddDigits.intersection(singleDigitPrimeNumbers)
for number in intersectionSet.sorted() {
    print(number, terminator: " ")
}
print("")

// 3. Используйте метод subtracting (_:) для создания множества со значениями не принадлежащих указанному множеству из двух входных.
let subtractingSet = singleDigitPrimeNumbers.subtracting(oddDigits)
for number in subtractingSet {
    print(number, terminator: " ")
}
print("")

// 4. Используйте метод symmetricDifference(_:) для создания нового множества из значений, которые не повторяются в двух входных множествах.
let differenceSet = oddDigits.symmetricDifference(singleDigitPrimeNumbers)
for number in differenceSet {
    print(number, terminator: " ")
}

let houseAnimals: Set = ["Dog", "Cat"]
let farmAnimals: Set = ["Dog", "Cat", "Horse", "Pig", "Chiken"]
let cityAnimals: Set = ["Mouse", "Crow"]

// 1. Используйте оператор равенства (==) для определения все ли значения двух множеств одинаковы.
houseAnimals == cityAnimals

// 2. Используйте метод isSubset(of:) для определения все ли значения множества содержатся в указанном множестве.
houseAnimals.isSubset(of: farmAnimals)

// 3. Используйте метод isSuperset(of:), чтобы определить содержит ли множество все значения указанного множества.
farmAnimals.isSuperset(of: houseAnimals)

// 4. Используйте методы isStrictSubset(of:) или isStrictSuperset(of:) для определения является ли множество подмножеством или надмножеством, но не равным указанному сету.
houseAnimals.isStrictSubset(of: farmAnimals)
farmAnimals.isStrictSuperset(of: houseAnimals)

// 5. Используйте метод isDisjoint(with:) для определения того, отсутствуют ли общие значения в двух множествах или нет.
// отсутствуют общие значения:
farmAnimals.isDisjoint(with: cityAnimals)
// есть общие значения
houseAnimals.isDisjoint(with: farmAnimals)



//: [Next](@next)
