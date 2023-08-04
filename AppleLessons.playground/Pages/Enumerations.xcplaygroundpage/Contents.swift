//: [Previous](@previous)

import Foundation

// MARK: Enumerations (перечисления)
// Перечисления в Swift - типы "первого класса". Они обладают особенностями, которые обычно поддерживаются классами, например, вычисляемые свойства (computed properties) для предоставления информации о текущем значении перечисления, методы экземпляра для дополнительной функциональности, относящейся к значениям, которые предоставляет перечисление.
// Перечисления так же могут объявлять инициализаторы для предоставлния начального значения элементам. Они так же могут быть расширены для наращивания своей функциональности над ее началной реализацией. Могут соответствовать протоколам для обеспечения стандартной функциональности.

// MARK: Синтаксис перечислений

enum SomeEnumeration {
    // объявление перечисления
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

// В отличии от C и Objective-C в Swift кейсам перечисления не присваиваются целочисленные значения по умолчанию при их создании.

// Множественные значения членов перечисления, могут записываться через запятую в одну строку
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

// тип directionToHead уже известен, поэтому можно не указывать тип явно при изменении значения
directionToHead = .east

// MARK: Использование перечислений с инструкцией switch
// требование к конструкции switch быть исчерпывающей, помогает случайно не пропустить член перечисления
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rise")
case .west:
    print("Where the skies are blue")
}

// если не удобно описывать кейс для каждого члена перечисления, то вы можете использовать кейс default, для закрытия всех остальных вариантов перечисления:
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// MARK: Итерация по кейсам перечисления
// Полчучение коллекции всех кейсов перечисления - нужно написать CaseIterable после имени перечисления. Этот синтаксис обозначает что перечисление соответствует протоколу CaseIterable

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for bevarage in Beverage.allCases {
    print(bevarage)
}

// MARK: Ассоциативные значения
// Ассоциативные значения - позволяют хранить дополнительную информацию вместе со значением кейса и разрешает изменять эту информацию каждый раз как вы используете кейс в вашем коде. Типы ассоциативных могут быть абсолютно разными для каждого кейса перечисления

// Перечисление типа Barcode, у которого два кейса один из них upc с ассоциативным значением типа (Int, Int, Int, Int) и qrCode с ассоциативным значением типа String

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
// этому же продукту может быть присвоено другое значение:
productBarcode = .qrCode("ABCDEFGH")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(var productCode):
    productCode = "assfsv"
    print("QR code: \(productCode)")
}
productBarcode.self

// MARK: Raw value (исходные (сырые) значения)

// В качестве альтернативы ассоциативным значениям, кейсы перечисления могут иметь исходные (сырые) значения, которые всегда одного типа

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Исходные значения могут быть строками, символами, целым числом или числов с плавающей точкой.
// Каждое исходное значение в рамках одного перечисления должно быть уникальным

// Исходные значения устанавливаются в качестве дефолтных значений, когда в первый раз определяете перечисление в вашем коде.
// Исходное значение для конкретного кейса перечисления всегда одно и то же

// Ассоциативные значения устанавливаются при создании новой константы или переменной, основываясь на одном из кейсов перечисления, и могут быть разными каждый раз когда вы это делаете

// MARK: Неявно установленные исходные значения

// При работе с перечислениями, которые хранят исходные значения ввиде строк или целочисленных значений, не нужно явно присваивать исходное значения для каждого кейса перечисления. Swift делает это автоматически

enum PlanetSunSystem: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let venusNumber = PlanetSunSystem.venus.rawValue

enum SomeCompassPoint: String {
    case north, south, east, west
}

let sunsetDirection = SomeCompassPoint.west.rawValue

// MARK: Инициализация через исходное значения

// Если объявили перечисление вместе с типом исходного значения, то перечисление автоматически получает инициализатор, который принимает значение типа исходного значения (rawValue) и возвращает либо член перечисления либо nil

let possiblePlanet = PlanetSunSystem(rawValue: 7)

// инициализаторы исходных значений всегда возвращают опциональное значение
print(type(of: possiblePlanet))


// Инициализатор исходного значения - проваливающийся инициализатор, потому как не каждое исходное значение будет возвращать кейс перечисления

let positionToFind = 11
if let somePlanet = PlanetSunSystem(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// MARK: Рекурсивные перечисления

// Рекурсивные перечисления - это такие перечисления, экземпляры которого являются ассоциативным значением одного или более кейсов перечисления. Вы обозначаете такие кейсы перечисления с помощью ключевого слова indirect перед кейсом, что сообщает компилятору что нужен дополнительный слой индирекции

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// Так же можно написать indirect прямо перед самим перечислением, что позволит обозначить то, что все члены перечисления поддерживают индиректность:

indirect enum ArithmeticExpressionTwo {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))


//: [Next](@next)
