//: [Previous](@previous)

import Foundation

// MARK: Control flow
// Инструкция switch ывполняется без провалов, однако если это требуется есть оператор fallthtrough. Кейсы могут сопоставлять различные типы шаблонов, включая сопоставление диапазонов, кортежей, а так же выполнять приведение к определенному типу

// MARK: Циклы for-in
// Цикл for-in используется для итерации по коллекциям элементов, таких как диапазоны чисел, элементы массива или символы в строке

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello \(name)!")
}

// когда происходит итерация по словарю, каждый его элемент возвращается как кортеж (ключ, значение). Можно разложить члены кортежа на отдельные константы, чтобы использовать их в теле цикла for-in

let numberOfLegs = [
    "spider": 8,
    "ant": 6,
    "cat": 4
]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// for-in с числовыми диапазонами
for index in 1...5 {
    print("\(index) умножить на 5 будет \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) в степени \(power) равно \(answer)")

let minutes = 60
for tickMark in 0..<minutes {
    if tickMark % 10 == 0 {
        print(tickMark, terminator: " ")
    }
}

// для того чтобы пропустить лишние деление (например через каждые 5 минут) нужна функция stride(from:to:by) не включая верхнюю границу
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

// функция stride(from:through:by) включает верхнюю границу
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark)
}

// MARK: Циклы while
// цикл while выполняет условие до тех пор, пока его условие не станет false.
// while - вычисляет условие выполнения в начале каждой итерации цикла
// repeat-while - вычисляет условие выполнения в конце каждой итерации цикла

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // бросок кубика
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    // ход на выпавшее количсетво шагов
    square += diceRoll
    if square < board.count {
        //если еще на поле идти вверх или вних согласно выпавшему значению
        square += board[square]
    }
}
print("Game over")

// MARK: цикл repeat-while
// цикл repeat-while выполняет одну итерацию до того, как происходит проверка условия
// repeat-while в swift аналогичен циклу do-while в других языках

square = 0
diceRoll = 0
repeat {
    // идти вверх или вниз по змеям или лестницам
    square += board[square]
    // бросить кубик
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    // ход на выпавшее количество шагов
    square += diceRoll
} while square < finalSquare
print("Game over!")

// MARK: Условные инструкции
// swift предоставляет два варианта добавить условные ответвления кода - это при помощи инструкции if и при помощи инструкции switch

// MARK: Инструкция if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen")
} else {
    print("It's not that cold. Wear a t-shirt")
}

temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen")
}

let temperatureInCelsius = 25
var weatherAdvice = String()
if temperatureInCelsius < 0 {
    weatherAdvice = "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius > 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen"
} else {
    weatherAdvice = "It's not that cold. Wear a t-shirt"
}
print(weatherAdvice)

// другой способ записать выражение выше более кратко
weatherAdvice = if temperatureInCelsius < 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius > 30 {
    "It's really warm. Don't forget to wear sunscreen"
} else {
    "It's not that cold. Wear a t-shirt"
}

// в такой записи все ветви инструкции if должны содержать выражения одного типа. Swift проверяет каждую ветвь инструкции if отдельно для определения типа. В случае со значением nil swift не может автоматически определить тип данных, так как он может соответствовать нескольким типам сразу, поэтому нужно указывать тип явно
let freezingWarning: String? = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}
freezingWarning

// другой способ записи выражения выше. Это предоставления типа для nil вместо аннотации типа для константы/переменной
let freezingWarning1 = if temperatureInCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil as String?
}
// Выражение if может реагировать на неожиданные сбои, вызывая ошибку или вызывая такую функцию, как fatalError(_:file:line:), которая никогда не возвращается. Например:
/*let weatherAdvice1 = if temperatureInCelsius > 100 {
    throw TemperatureError.boiling
} else {
    "It's a reasonable temperature."
}
*/

// MARK: Инструкция switch
// инструкция switch подразумевает наличие какого-то значения, которое сравнивается с несколькими возможными шаблонами.
// каждая инструкция switch должна быть исчерпывающей.

var someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter on the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// другой способ записи, аналогично оператору if
let message = switch someCharacter {
case "a":
    "The first letter on the alphabet"
case "z":
    "The last letter of the alphabet"
default:
    "Some other character"
}
print(message)

// MARK: Отсутствие case-провалов
// Инструкция switch прекращает выполнение после нахождения первого соответствия c case и выполнении соответствующего кода в ветке, без необходимости явного вызова break
// тело каждого case должно иметь хотя бы одно исполняемое выражение

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

// Для того чтобы у вас появилась возможность проваливаться в конце конкретного switch кейса используйте ключевое слово fallthrough

// MARK: соответствие диапазону
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings)")


// MARK: Кортежи
// Каждый элемент кортежа может быть протестирован с любой вечличиной или с диапазоном величин.

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print("\(somePoint) is at the original")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

// MARK: Привязка значений (value binding)
// Кейс в инструкции switch может связывать значение ил значения, с которыми он сравнивается, с временными константами или переменными.

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("someWhere else at (\(x), \(y)")
}
// инструкция switch исчерпывающая, поэтому default не нужен

// MARK: Where
// В кейсе switch возможно использование дополнительного условия where

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// MARK: Составные кейсы
// Если несколько кейсов инструкции switch содержат один и тот же код для исполнения, то шаблоны этих кейсов можно объеденить через запятую после ключевого слова case.

someCharacter = "e"

switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

// Cоставные кейсы так же могут включать в себя привязку значения. Все шаблоны кейсов должны включать в себя тот же самый набор значений (название временной константы/переменной должно совпадат) и каждая связка должна быть одного и того же типа из всех шаблонов составного кейса.

let stillAnotherPoint = (0, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// MARK: Операторы передачи управления
// Операторы передачи управления меняют последовательность исполнения вашего кода, передавая управленик от одного фрагмента кода другому. В swift есть пять операторов передачи управления:
// 1. continue
// 2. break
// 3. fallthrough
// 4. return
// 5. throw

// MARK: Оператор continue
// Оператор continue говорит циклу прекратить текущую итерацию и начать новую. Он как бы говорит "Я закончил с текущей итерацией", но полностью из цикла не выходит

let puzzleInput = "great mids think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

// MARK: Оператор break
// Оператор break останавливает выполнение всей инструкции управления потоком. Может быть использован внутри инструкции switch или внутри цикла, когда вы хотите остановить дальнейшее выполнение switch или цикла раньше, чем он должен закончиться сам по себе

// MARK: Оператор break в цикле
// Когда оператор break используется внутри цикла, то он немедленно прекращает работу цикла, и выполнение кода продолжается с первой строки после закрывающей скобки цикла (}). Никакой последующий код из текущей итерации цикла выполняться не будет, и никакие дальнейшие итерации цикла не будут запускаться

// MARK: Оператор break в инстукции switch
// Когда оператор break используется внутри инстукции switch, то он прекращает исполнение кода конкретного случая и перекидывает исполнение на первую строку после закрывающей скобки } инструкции swicth
// break может использоваться для сопоставления или игнорирования кейсов в инструкции switch.
// Кейс в инстукции switch, который содержит только комментарий, при компиляции выдаст ошибку компиляции

let numberSymbol: Character = "三" // Цифра 3 в упрощенном Китайском языке var possibleIntegerValue: Int?
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一":
    possibleIntegerValue = 1
case "2", "٢", "二":
    possibleIntegerValue = 2
case "3", "٣", "三":
    possibleIntegerValue = 3
case "4", "٤", "四":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

// MARK: оператор fallthrough
// оператор fallthrough позволяет провалиться в следующий кейс игнорируя его условие

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// MARK: маркированные инструкции
// В условиях вложенности циклов или инстукций иногда возникает необходимость остановки определенной инстукции или цикла с помощью оператора break или указания на какой из циклов будет бействовать оператор continue
// для этих целей можно маркировать инструкцию switch или цикл маркером инструкций и использовать этот маркер с операторами continue или break

square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over")

// MARK: Ранний выход
// если выполняется условие guard (true) то исполнение кода переходит на первую строку после закрывающей скобки (}) инструкции guard. Если условие (false) то выполняется код внутри else

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hi \(name)!")
    
    guard let location = person["location"] else {
        print("Надеюсь у тебя там хорошая погода")
        return
    }
    print("надеюсь в \(location) хорошая погода")
}
greet(person: ["name" : "John"])
greet(person: [
    "name" : "Jane",
    "location" : "Cupertino"
])

// если условие инструкции guard выполнилось, то выполнение кода продолжается после закрывающей скобки guard. Все переменные и константы, которым мы присвоили значения с использованием опциональной привязки в качестве части условия guard, доступны нам до конца области где был определен guard

// если условие не выполняется, то исполняется код внутри else. Эта ветка должна перебросить исполнение кода на выход из этого блока где был определен guard. А сделать это можно при помощи инструкций return, break, continue, throw или можно вызвать метод который ничего не возвращает, например fatalError(_file:line:)

// MARK: проверка доступности API
// В swift есть встроенная поддержка для проверки доступности API, благодаря которой можно быть уверенным в том что не используете API-интерфейсы, недоступные для данной deployment target

if #available(iOS 14, macOS 10.12, *) {
    print("данные API доступны")
} else {
    print("используйте более старые API")
}

// MARK: Deffered actions
// Блок отсрочки - запускается после выполнения определенного оператора или функции при выходе из ее области видимости
var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}

if score < 100 {
    score += 100
    defer {
        score -= 100
    }
    // Other code that uses the score with its bonus goes here.
    print(score)
}
score

// Если в одной области видимости объявлено несколько defer, то первым будет выполняться последний (то есть в обратном порядке)
if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    score += 5
}


//: [Next](@next)
