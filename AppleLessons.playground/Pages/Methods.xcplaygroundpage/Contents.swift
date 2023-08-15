//: [Previous](@previous)

import Foundation

// MARK: Methods

// В swift при любом раскладе вне зависимости от того, какой тип мы используем (структуру, класс или перечисление) можно определять методы

// MARK: Методы экземпляра

// Методы экземпляра - это функции которые ассоциированы с конкретным типом (структура, класс, перечисление), обеспечивающие функциональность его экземпляров

// Метод экземпляра объявляется внутри фигурных скобок типа, которому принадлежит. Метод экземпляра имеет неявным доступ ко всем остальным методам экземпляра и свойствам этого типа.
// Метод экземпляра нельзя вызвать в изоляции без какого либо экземпляра

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.count
counter.reset()

// MARK: Свойство self

// Каждый экземпляр типа имеет неявное свойство self, которое является абсолютным эквивалентом самому экземпляру. Вы испольуете свойство self для ссылки на текущий экземпляр, внутри методов этого экземпляра

// На практике не нужно писать self очень часто. Если не писать self то Swift полагает, что вы ссылаетесь на свойство или метод экземпляра каждый раз, когда вы используете известное имя свойства или метода внутри метода

// Главное исключение из этого правила, когда имя пераметра метода и и свойство экземпляра совпадают

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right")
}

// MARK: Изменение типов значений методами экземпляра

// Структуры и переменные являются типами значений. По умолчанию свойства Value type не могут быть изменены внутри методов экземпляра.

// Однако если нужно изменить свойства вашей свтруктуры или перечисления изнутри конкретного метода, то вы можете выбрать поведение как изменяющее для этого метода. (с помощью ключевого слова mutating перед словом func для определения метода

// Метод так же может присвоить совершенно новый экземпляр для свойства self, и этот новый экземпяр заменит существующий после того как выполнение метода закончится

struct PointTwo {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var anotherPoint = PointTwo(x: 1.0, y: 1.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)


// для экземпляров структуры или перечисления объявленных как let вызов метода mutating невозможен


// MARK: Присваивание значений для self внутри изменяющего метода

// Изменяющие методы могут присвоить абсолютно новый экземпляр неявному свойству self

struct PointThree {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = PointThree(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .high
        }
    }
}

// MARK: Методы типа

// Методы которые вызываются непосредственно самим типом, а не экземпляром, назыкаются методами типа

// Для указания метода типа ставится ключевое слово static, перед ключевым словом func. Классы так же могут использовать ключевок слово class, чтобы разрешать подклассам переопределение инструкций суперкласса этого метода

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    // разблокирование нового уровня
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    // метод для помощи в управлении свойством currentLevel 
    @discardableResult mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    // обозначает номер уровня который прошли
    func complete(level: Int) {
        // разблокирование нового уровня
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Petr")
player.complete(level: 1)
player.tracker.currentLevel
LevelTracker.highestUnlockedLevel
LevelTracker.isUnlocked(2)

var playerTwo = Player(name: "Igor")
playerTwo.tracker.advance(to: 3)






//: [Next](@next)
