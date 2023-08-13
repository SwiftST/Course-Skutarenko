//: [Previous](@previous)

import Foundation

// MARK: Properties

// Свойства хренения и вычисляемые свойства обычно связаны с экземпляром конкретного типа. Однако свойства так же могут быть связаны и с типом самим по себе. Такие свойства известны как свойства типа

// MARK: Свойства хранения

// В самой простой форме свойтсво хранения - константа или переменная, которая хранится как часть экземпляра определенного класса или структуры.
// Свойства хранения могут быть - переменное свойство хранения (var), постоянное свойство хранения (let)

struct FixedLenghtRange {
    var firstValue: Int
    let lenght: Int
}
var rangeOfThreeItems = FixedLenghtRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6

// MARK: Свойства хранения постоянных экземпляров структуры
// Если при создании экземпяра структуры объявить его как константа, то будет нельзя менять его свойства, даже если они объявлены как переменные.
// Такое поведение характерно для Value type, когда экземпляр отмечен как константа то все его свойства так же считаются константами

let rangeOfFourItems = FixedLenghtRange(firstValue: 0, lenght: 4)
//rangeOfFourItems.firstValue = 6 - вызовет ошибку

// MARK: Ленивые свойства хранения

// Ленивое свойство хранения - свойство, начальное значение которого не вычисляется до первого использования.

// Всегда объявляйте ленивое свойтсво хранения с помощью ключевого слова var, потому что значение этого свойства может быть не получено до окончания инициализации

// Ленивые свойства полезны, когда исходное значение зависит от внешнх факторов, значения которых неизвестны до окончания инициализации. Так же они полезны, когда начальное значение требует комплексных настроек или сложных вычислений, которые не должны быть проведены до того момента пока они не понадобятся

class DataImporter {
    /*
     класс для импорта данных их внешних источников
     считаем что классу требуется большое количество времени для инициализации
     */
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.fileName)

// Если к свойству обозначенному через модификатор lazy обращаются сразу с нескольких потоков единовременно, и оно еще не было инициализировано, то нет никакой гарантии, что оно будет инициализировано всего один раз


// MARK: Computed property

// В дополнение к свойствам хранения, классам, структурам и перечислениям можно добавить вычисляемые свойства, которые фактически не хранят значения. Вместо этого они предоставляют геттер и опциональный сеттер для получения и установки других свойств косвенно

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15, y: 15)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// MARK: Сокращенный вариант сеттера

// Если  сеттер не определяет имени, то имя по умолчанию - newValue

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// MARK: Сокращенный вариант объявления геттера

// Если все тело геттера представляет собой одно выражение, то геттер неявно возвращает это выражение
// return можно опустить

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// MARK: Вычисляемые свойства только для чтения

// Высичляемое свойство меющее геттер, но не имеющее сеттера известно так же как вычисляемое свойство только для чтения

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fouByFiveByTwo = \(fourByFiveByTwo.volume)")

// MARK: Наблюдатели свойтсва (observers)

// Наблюдатели свойства могут наблюдать и отвечать на изменения значения свойства. Наблюдатели свойств вызываются каждый раз, как устанавливается значение свойству, даже если устанавливаемое значение не отличается от текущего

// Наблюдатели могут быть добавлены:
// 1. В свойства хранения, которые определяем
// 2. В свойтсва хранения, которые наследуем
// 3. В вычисяемые свойства, которые наследуем (использование сеттера для наблюдения за изменением свойства)

// Есть опция определить один или оба наблюдателя свойства:
// willSet (по умолчанию newValue) вызывается прямо перед сохранением значения
// didSet (по умолчанию oldValue) вызывается сразу после сохранения значения

// Наблюдатели willSet и didSet суперкласса вызываются, когда свойство утсанавливается в инициализаторе подкласса.

class StepCounter {
    var totalStep: Int = 0 {
        willSet(newTotalStep) {
            print("Вот вот значение будет равно \(newTotalStep)")
        }
        didSet {
            if totalStep > oldValue {
                print("Добвлено \(totalStep - oldValue) шагов")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 360
stepCounter.totalStep = 100

// Если вы передаете свойство имеющее наблюдателей, в функцию в качестве сквозного параметра, то наблюдатели willSet и didSet всегда вызываюстя. Это происходит из за модели копирования copy-in copy-out для сквозных параметров: значение всегда записывается обратно в свойство в конце функции













//: [Next](@next)
