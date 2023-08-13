//: [Previous](@previous)

import Foundation

// MARK: Глобальные и локальные переменные

// Глобальные переменные - переменные, которые объявляются вне любой функции, метода, замыкания или контекста типа.
// Локальные переменные - переменные, которые объявляются внутри функции, метода или внутри контекста замыкания

// Вычисляемые переменные аналогично вычисляемым свойствам, вычисляют значение вместо того, чтобы его хранить

// Глобальные контсанты и переменные вычисляются отложено, аналогично свойствам ленивого хранения.
// Локальные константы и переменные никогда не вычисляются отложено

// MARK: Свойства типа

// Свойства которые принадлежат самому типу, а не экземплярам этого типа на зываются свойствами типов

// В отличии от свойств хранения экземпляров, свойствам типов нужно всегда давать значение по умолчанию. Это потому, что тип сам по себе не имеет инициализатора, который мог бы присвоить значение хранимому свойству.

// Хранимые свойтсва типа отложено инициализируются при первом обращении к ним. Они гарантировано инициализируются только один раз, даже если они доступны сразу с нескольких потоков. Эти свойтсва не нуждаются в маркировке lazy

// MARK: Синтаксис свойства типа

struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 0
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 22
    }
    // переопределяемое вычисляемое свойство типа
    class var overridableComputedTypeProperty: Int {
        return 11
    }
}

// MARK: Запросы и установка свойств типа

// Обращение к свойству типа и присваивание ему нового значения происходит через точечный синтаксис

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

struct AudioChannel {
    // максимально допустимый уровень звука
    static var thredholdLevel = 10
    // максимально установленный уровень звука для всех экземпляров структуры AudioChannel
    static var maxInputLevelForAllChannels = 0
    // текущий уровень звука
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > Self.thredholdLevel {
                currentLevel = Self.thredholdLevel
            }
            if currentLevel > Self.maxInputLevelForAllChannels {
                Self.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 12
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)









//: [Next](@next)
