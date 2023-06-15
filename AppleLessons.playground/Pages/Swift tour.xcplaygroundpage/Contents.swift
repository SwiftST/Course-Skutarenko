//: [Previous](@previous)

import Foundation

print("Hello world")

// Simple values

var floatNumber: Float = 4

let label = "The width it "
let width = 94
let widthLabel = label + String(width)

let apples = 5
let oranges = 6
let fruitSum = "all fruits = \(apples + oranges)"

// многостроччный литерал
let someString = """
gffyhfu
yyggbyug
ygvyg
"""
print(someString)

var buyList = ["banana", "sugar", "cherry"]
buyList[0]
var workers = [
    "bob": "Ingener",
    "lucy": "manager"
]
workers["tom"] = "debeloper"
workers.count

buyList.append("water bottle")
buyList.count

// Control flow (управление потоком)

var individualScore = [1, 3, 22, 88]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = nil
print(optionalString == nil)
var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    print("is nil😒")
}

var nickName: String?
let fullName = "Oleg"
print(nickName ?? fullName)

let vegetable = "red pepper"
switch vegetable {
case "ba":
    print("ba")
case let a where a.hasSuffix("pepper"):
    print("is \(a)")
default:
    break
}

// итерация по словарю
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var nameKey = ""
for (name, numbers) in interestingNumbers {
    for number in numbers {
        if largest < number {
            largest = number
            nameKey = name
        }
    }
}
print("\(largest) in \(nameKey)")

var n = 2
while n < 100 {
    n *= 2
}

repeat {
    n *= 2
} while n < 100



var firstLoopValue = 0
for i in 1..<4 {
    firstLoopValue += i
}
firstLoopValue

// Fuctions and closures

func greet(_ name: String, day: String) -> String {
    "Hello " + name + " today is " + day
}
print(greet("Bob", day: "Thursday"))

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score < min {
            min = score
        } else if score > max {
            max = score
        }
        sum += score
    }
    return (min, max, sum)
}

let tupleStatistics = calculateStatistics(scores: [2, 33, 55, 2, 11, 3])
tupleStatistics.sum
tupleStatistics.min

func returnFifteen() -> Int {
    var a = 10
    func add() {
        a += 5
    }
    add()
    return a
}
var a = returnFifteen
a()
a()

func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrement()

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

hasAnyMatches(list: [2, 345, 223, 22]) { a in
    a > 100
}
var numbers = [223, 22, 21, 67]
numbers.map { a in
    return a / 100
}
var someNum = numbers.map { a in
    a % 2 == 0 ? a : 0
}
someNum

let sortedNumbers = numbers.sorted {
    $0 > $1
}

// Объекты и классы

class Shape {
    let numberOfSides = 0
    var direction: String?
    
    func returnDirection() -> String {
        if let direct = direction {
            return direct
        }
        return "Направление неизвестно"
    }
    
    func simpleDescription() -> String {
        "A shape with \(numberOfSides) sides"
    }
}

let someInstance = Shape()
print(someInstance.returnDirection())
print(someInstance.simpleDescription())

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        "A shape with \(numberOfSides) sides"
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        // инициализатор родительского класса
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of lenght \(sideLength)"
    }
}
let test = Square(sideLength: 5, name: "my square")
test.area()
test.simpleDescription()

// Создайте другой подкласс Circle класса NamedShape, который принимает радиус и имя в качестве аргументов в их инициализатор. Реализуйте метод area() и метод simpleDescription() класса Circle.

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        
        super.init(name: name)
    }
    
    func area() -> Double {
        3.14 * pow(radius, 2)
    }
    
    override func simpleDescription() -> String {
        "A circle radius equal = \(radius)"
    }
}

var circle = Circle(radius: 5, name: "my circle")

circle.area()
circle.simpleDescription()

class EquilateralTringle: NamedShape {
    var sideLength: Double = 0
    
    var perimetr: Double {
        get {
            3 * sideLength
        }
        set {
            sideLength = newValue / 3
        }
    }
    
    init(sideLength: Double, name: String) {
        // 1 - установка свойств подкласса
        self.sideLength = sideLength
        // 2 - вызов инициализатора родительского класса
        super.init(name: name)
        // 3 - изменение свойства родительского класса, Любые дополнительые работы по начальной установке, которые используют методы, getter'ы и setter'ы могут быть включены в этом месте
        numberOfSides = 3
    }
    
    override func simpleDescription() -> String {
        "An equilateral triangle with sides of lenght \(sideLength)"
    }
}

var triangle = EquilateralTringle(sideLength: 3, name: "my Triangle")

triangle.perimetr
triangle.perimetr = 25
triangle.sideLength

class TriangleAndSquare {
    var triangle: EquilateralTringle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        triangle = EquilateralTringle(sideLength: size, name: name)
        square = Square(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 3, name: "test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 5, name: "Larger square")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.square.name)

// Опциональные цепочки. Когда работаем с опциональными значениями, вы можете написать ? перед такими операциями как: методы, свойтсва или индексаторы. Если значение перед ? - nil, то все что после игнорируется и значение всего выражения становится nil. В противном случае опциональное значение извлекается и все что после ? выполняется
var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
optionalSquare = nil
let anotherSide = optionalSquare?.sideLength

// Перечисления и структуры

enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

Rank.allCases

let ace = Rank.ace
ace.simpleDescription()
let aceRawValue = ace.rawValue
let king = Rank.king

// Напишите функцию, сравнивающую два Rank значения, с помощью сравнения их исходных (raw) значений.
func compareTwoRank(_ one: Rank, and second: Rank) {
    switch (one.rawValue, second.rawValue) {
    case let (x, y) where x > y:
        print("one more than second")
    case let (x, y) where x < y:
        print("one less than second")
    default:
        print("one equal second")
    }
}
compareTwoRank(ace, and: king)

// Используйте инициализатор init?(rawValue:) для того, чтобы создать экземпяр перечисления из исходного значения

if let convertedRank = Rank(rawValue: 3) {
    let threeDesription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    var color: String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
hearts.color

enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let succes = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch succes {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}


struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func returnFullDeck() -> [Rank: Suit] {
        var dict: [Rank: Suit] = [:]
        for i in Rank.allCases {
            dict[i] = suit
        }
        return dict
    }
}
let threeOfSpades = Card(rank: .four, suit: .spades)
print(threeOfSpades.simpleDescription())
threeOfSpades.returnFullDeck()

// Протоколы и расширения



//: [Next](@next)
