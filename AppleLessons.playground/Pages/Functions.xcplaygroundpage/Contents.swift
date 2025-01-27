//: [Previous](@previous)

import Foundation

// MARK: Functions
// Функции - это автомномные блоки кода, выполняющие определенную задачу. Имя функции определяет, что она делает и это имя используется для "вызова" функции
// Каждая функция в Swift имеет тип, описывающий тип параметров функции и тип возвращаемого значения. Тип функции можно использовать аналогично любым другим типам в Swift, т.е. одна функция может быть параметром другой функции либо ее результирующим значением. Функции также могут вкладываться друг в друга, что позволяет инкапсулировать определенный алгоритм внутри локального контекста.

// MARK: Объявление и вызов функций
// При объявлении функции можно задать одно или несколько именованных типизированных значений, которые будут ее входными данными (или параметрами), а так же тип значения, которое функция будет возвращать в качестве результата (или возвращаемый тип)

// каждая функция должна иметь имя (lowerCamelCase) отражающее ее решаемую задачу. Чтобы воспользоваться функцией ее нужно вызвать, указав имя и входные значения (аргументы), соответствующие типам параметров этой функции. Аргументы функции всегда должны идти в том же порядке, в каком они были указаны при объявлении функции.

func greet(person: String) -> String {
    let greeting = "Привет, " + person + "!"
    return greeting
}
greet(person: "Bob")
print(greet(person: "Anna"))

// У print(_:separator:terminator:) нет ярлыка для первого аргумента, и его другие аргументы являются опциональными, поскольку имеют дефолтные значения (по умолчанию)

func greetAgain(person: String) -> String {
    "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

// MARK: Функции без параметров

func sayHelloWorld() -> String {
    return "hello world"
}
print(sayHelloWorld())
print(type(of: sayHelloWorld))

// MARK: Функции с несколькими входными параметрами
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

// MARK: Функции не возвращающие значения
func greetTwo(person: String) {
    print("Привет, \(person)!")
}
greetTwo(person: "Dave")

// Функция greetTwo(person:) все же возвращает значение. Функции для которых не заадан возвращаемый тип, получают специальный тип Void. По сути, это просто пустой кортеж, т.е. кортеж с нулем элементов, который записывается как ()

// выходное значение функции может быть игнорировано:

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// Хотя возвращаемое значение можно игнорировать, функция все же должна возвратить то, что задано в ее объявлении. Функция для которой указан возвращаемый тип не может закончиться оператором, который ничего не возвращает, иначе произойдет ошибка во воемя компиляции

// MARK: функции, возвращающие несколько значений
// функция может возвращать несколько параметров с помощью кортежа
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = currentMin
    for value in array[1...] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])

print("Min value is \(bounds.min)\nMax value is \(bounds.max)")

// MARK: Опциональный кортеж как возвращаемый тип

// Если возвращаемый из функции кортеж может "не иметь значения", то его следует объявить как опциональный кортеж, т.е. кортеж который может равняться nil.

// Кортеж-опционал вида (Int, Int)? - это не то же самое что кортеж содержащий опционалы (Int?, Int?). Кортеж опционал сам является опционалом, но не обязан состоять из опциональных значений

func minMaxTwo(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else {
        return nil
    }
    var currentMin = array[0]
    var currentMax = currentMin
    for value in array[1...] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMaxTwo(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// MARK: Функции с неявным возвращаемым значением
// Если функция состоит из единственного выражения, то функция неявно возвращает это значение

func greeting(for person: String) -> String {
    "Hi" + person + "!"
}
print(greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hi" + person + "!"
}
print(anotherGreeting(for: "Dave"))

// Геттер так же может использовать сокращенную форму записи

// MARK: Ярлыки аргументов и имена параметров функции
// каждый параметр функции имеет ярлык аргумента и имя параметра. Ярлык аргумента используется при вызове функции. Каждый параметр при вызове функции записывается с ярлыком аргумента, стоящим перед ним. Имя параметра используется при реализации функции. По умолчанию параметры используют имена их параметров в качестве ярлыка аргумента

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}
// все параметры должны иметь уникальные имена
// несколько параметров могут иметь один ярлык аргумента

// MARK: Ярлыки аргументов
// ярлык аргумента пишется перед именем параметра:
func someFunction(argumentLabel parameterName: Int) {
    // в теле функции parameterName относится к значению аргумента
    // для этого параметра
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}
print(greet(person: "Bill", from: "Skolkovo"))

// использование ярлыков аргументов позволяет функции вызываться в более выразительной манере, в виде предложения, при этом все же предоставляя тело функции в более читаемом виде и с более понятными намерениями

// MARK: Пропуск ярлыков аргументов
// если нет необходимости использовать ярлык аргумента, нужно использовать нижнее подчеркивание

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)

// MARK: Значения по умолчанию для параметров
// При объявлении функции параметру можно присвоить значение по умолчанию (кроме inout параметров, вариативных параметров)
// Если у параметра есть значение по умолчанию то при вызове этот параметр можно опустить

func someFunction(parameterWithiutDefault: Int, parameterWithDefault: Int = 12) {
    
}

// первыми распологаются параметры без дефолтных значений

// MARK: Вариативные параметры
// Вариативный параметр - может иметь сразу несколько значений или не иметь ни одного. С помощью вариативного параметра можно передать в функцию произвольное число входных значений.
// Значения переданные через вариативный параметр, доступны внутри функции в виде массива соответствующего типа.

func aritmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
aritmeticMean(1, 2, 3, 4, 5)

// Функции могут иметь несколько вариативных параметров. Первый параметр, который идет после вариативного параметра должен иметь ярлык аргумента. Ярлык аргумента позволяет однозначно определить какие аргументы передаются вариативному, а какие параметрам, которые идут после вариативного парметра

// MARK: Сквозные параметры
// Параметры функции по умолчанию являются константами. Попытка изменить значение функции из тела этой функции приводит к ошибке компиляции. Это означет что вы не сможете изменить значение параметра по ошиьке. Если нужно чтобы функция изменила значение параметра и эти изменения сохранились после вызова функции, этот параметр следует объявить в качестве сквозного (inout)
// Для создания сквозного параметра нужно поставить ключевое слово inout перед типом объявляемого параметра. Сквозной параметр передает значение в функцию, которое затем изменяется в ней и возвращается из функции, заменяя исходное значение
// В качестве аргумента для сквозного параметра может служить только переменная. Нельзя передать константу или значения литерала в качестве аргумента, так как константы и литералы не могут быть изменены.
// При вызове функции перед сквозным параметром ставится амперсанд (&) чтобы указать, что он может быть измене с помощью функции
// Сквозные параметры не могут иметь значения по умолчанию, а вариативные параметры не могут быть сквозными, с ключевым словом inout

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// Cквозные параметры - это альтернативный способ передачи изменений, сделанных внутри функции, за пределы тела этой функции

// MARK: Функциональные типы
// У каждой функции есть специальный функциональный тип, состоящий из типов параметров и типа возвращаемого значения

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}
print(type(of: addTwoInts))
print(type(of: multiplyTwoInts))

func printHelloWorld() {
    print("Hello, world")
}
print(type(of: printHelloWorld))

// MARK: Использование функциональных типов
// в swift с функциональными типами можно работать так же, как и с другими типами
var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

// этой же переменной можно присвоить другую функцию такого же типа
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

// тип можно не указвать явно:
let anotherMathFunction = addTwoInts

// MARK: Функциональные типы как типы парметров
// Функциональные типы могут быть типами параметров другой функции

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

// MARK: Функциональные типы как возвращаемые типы
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// MARK: Вложенные функции
// Вложенныее функции по умолчанию недоступны извне, а вызываются и используются только заключающей функцией

func chooseStepFunctionTwo(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward : stepForward
}

var currentValueTwo = -4
let moveNearerToZeroTwo = chooseStepFunctionTwo(backward: currentValueTwo > 0)
while currentValueTwo != 0 {
    print("\(currentValueTwo)...")
    currentValueTwo = moveNearerToZeroTwo(currentValueTwo)
}
print("Zero")

//: [Next](@next)
