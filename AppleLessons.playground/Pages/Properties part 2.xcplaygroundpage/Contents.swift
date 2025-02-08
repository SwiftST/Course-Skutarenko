//: [Previous](@previous)

import Foundation

// MARK: - Обертки свойств (property wrappers)

// Обертка свойства добавляет слой резделения между кодом, который определяет как свойство хранится и кодом, который определяет само свойство.
// Когда вы используете обертку, то вы пишите управляющий код один раз, а затем определяете обертку, которую можете переиспользовать для необходимых свойств

// Для того, чтобы определить обертку, вы создаете структуру перечисление или класс, который определяет свойство wrappedValue (обернутое значение)

// Структура TwelveOrLesson проверяет, что значение, которое оно "оборачивает" всегда хранит значение равное или меньше 12. Если вы попробуете хранить большее значение, чем 12, то в итоге хранится будет именно 12

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
// сеттер проверяет что новые значения меньше 12, а геттер возвращает хранящееся значение


// вы применяете обертку для свойства написав имя обертки перед свойством в виде атрибута.
struct SmallRectangle {
    @TwelveOrLess var height: Int {
        willSet {
            print("will set height to \(newValue)")
            if newValue > 12 {
                print("will set value from property wrapper")
            }
        }
        didSet {
            print("did set height to \(height) instead of \(oldValue)")
        }
    }
    @TwelveOrLess var width: Int
}
var rectangle = SmallRectangle()
rectangle.height
rectangle.height = 10
rectangle.height
rectangle.height = 24
rectangle.height

// свойства height и width получают свои начальные значения из определения обертки TwelveOrLess, которая устанавливаемо TwelveOrLess.number равным 0.

// Пример явного обертывания своих свойств в структуру TwelveOrLess, вместо того чтобы писать @TwelveOrLess в качестве атрибута

struct SmallRectangle1 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
// свойства _height и _width хранят экземпляр обертки TwelveOrLess. Геттер и сеттер для height и width обертывают доступ к свойству wrappedValue

@propertyWrapper
struct UpperCaseWrapper {
    private var value: String
    
    var wrappedValue: String {
        get { return value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue: String) {
        value = wrappedValue.uppercased()
    }
}

struct Person {
    @UpperCaseWrapper
    var name: String
}
var somePers = Person(name: "kyle")
print(somePers.name)
somePers.name = "Lidia"
somePers.name

// MARK: - Установка исходных значений для оберток свойств

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
        print("init(wrappedValue:)")
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// когда мы не указываем начального значения для свойства используется инициализатор init()

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var weight: Int
}

var zeroRectangle = ZeroRectangle()
zeroRectangle.height
zeroRectangle.weight

// если указать начальное значение для свойства будет использоваться инициализатор init(wrappedValue:)

struct UnitRectangle {
    @SmallNumber var height: Int
    @SmallNumber var weight: Int
}
var unitRectangle = UnitRectangle()
unitRectangle.height
unitRectangle.weight

// когда мы пишем аргументы в круглых скобках после названия атрибута обертки, Swift использует инициализатор, который принимает эти аргументы, для настройки обертки

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var weight: Int
}

var narrowRectangle = NarrowRectangle()
narrowRectangle.height
narrowRectangle.weight

narrowRectangle.height = 100
narrowRectangle.weight = 100

narrowRectangle.height
narrowRectangle.weight

// Когда вы включаете аргументы обертки свойства вы так же можете указать начальное значение с помощью присваивания. Swift обрабатывает присвоение как аргумент wrappedValue и использует инициализатор, который принимает включенные вами аргументы

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
mixedRectangle.height
mixedRectangle.width
mixedRectangle.width = 100

mixedRectangle.width

// MARK: - Проецирование значения из обертки свойства

// В дополнении к обернотому значению обертка свойства может предоставлять дополнительные функциональные возможности, определяя проецируемое значение, например, обертка свойства, которая управляет доступом к базе данных, может предоставлять метод flushDatabaseConnection() для ее проецируемого значения. Имя проецируемого значения такое же как и значение в обертке, за исключением того что оно начинается со знака $. Поскольку ваш код не может определять свойства начинающиеся с символа $, проецируемое значение никогда не влияет на свойства, которые вы определяете.

@propertyWrapper
struct SmallNumber2 {
    private var number: Int
    // свойство projectedValue, позволяет определить скорректировала ли обертка новое значение перед тем как его сохранить
    private(set) var projectedValue: Bool
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    init() {
        number = 0
        projectedValue = false
    }
}

struct SomeStructure {
    @SmallNumber2 var someNumber: Int
}

var someStucture = SomeStructure()
someStucture.someNumber
someStucture.someNumber = 222
someStucture.$someNumber

// Обертка свойства может возвращать значение любого типа в качестьве своего проецируемого значения.
// Обертка, которая должна предоставлять больше информации, мможет вернуть экземпляр какого-либо другого типа данных или может вернуть self, чтобы предоставить экземпляр в качестве его проецируемого значения

enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber2 var height: Int
    @SmallNumber2 var width: Int
    
    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 200
        }
        return $height || $width
    }
}
var sizedRectangle = SizedRectangle()
sizedRectangle.resize(to: .small)
sizedRectangle.height
sizedRectangle.width

//: [Next](@next)
