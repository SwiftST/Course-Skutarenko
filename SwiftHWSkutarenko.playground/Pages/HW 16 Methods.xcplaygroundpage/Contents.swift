//: [Previous](@previous)

import Foundation

/* Сделаем с вами небольшую игру =)
 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате

 2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
 Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически

 3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.

 4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)

 5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)

 Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение */

//@propertyWrapper
//struct Rectangle {
//    private var number = 5
//    var wrappedValue: Int {
//        get { return number }
//        set { number = newValue > 4 ? newValue : number }
//    }
//}

class Box {
    
    var x: Int {
        didSet(oldX) {
            guard 1...Room.weight ~= x else {
                x = oldX
                print("Ход не возможен")
                return
            }
        }
    }
    var y: Int {
        didSet(oldY) {
            guard 1...Room.height ~= y else {
                y = oldY
                print("Ход не возможен")
                return
            }
        }
    }
    let symbol = "🗄️"
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func moveBox(direction: Direction) -> Bool {
        switch direction {
        case .Left where Room.checkCoord(x: x - 1, y: y):
            self.x -= 1
            return true
        case .Right where Room.checkCoord(x: x + 1, y: y):
            self.x += 1
            return true
        case .Up where Room.checkCoord(x: x, y: y + 1):
            self.y += 1
            return true
        case .Down where Room.checkCoord(x: x, y: y - 1):
            self.y -= 1
            return true
        default:
            return false
        }
    }
}

struct Room {
    static let weight = 5
    static let height = 5
    
    static func checkCoord(x: Int, y: Int) -> Bool {
        1...weight ~= x && 1...height ~= y
    }
    
    func printRoomAnd(person: Person, and box: Box) {
        for y in (1...Room.height).reversed() {
            for x in 1...Room.weight {
                if person.x == x && person.y == y  {
                    print("\(person.symbol)", terminator: "")
                } else if box.x == x && box.y == y {
                    print("\(box.symbol)", terminator: "")
                } else {
                    print("⬜️", terminator: "")
                }
            }
            print("")
        }
        print("")
    }
}

enum Direction {
    case Left
    case Right
    case Up
    case Down
}

struct Person {
    
    var x: Int = 1 {
        didSet(oldX) {
            guard 1...Room.weight ~= x else {
                x = oldX
                print("Ход не возможен")
                return
            }
        }
    }
    var y: Int = 1 {
        didSet(oldY) {
            guard 1...Room.height ~= y else {
                y = oldY
                print("Ход не возможен")
                return
            }
        }
    }
    let symbol = "🐥"
    
    
    mutating func movePersonBy(direction: Direction, box: Box) {
        switch direction {
        case .Left where Room.checkCoord(x: x - 1, y: y):
            if checkCoordBox(box, x: self.x - 1, y: self.y) {
                if box.moveBox(direction: direction) {
                    self.x -= 1
                    break
                } else {
                    break
                }
            }
            self.x -= 1
        case .Right where Room.checkCoord(x: self.x + 1, y: self.y):
            if checkCoordBox(box, x: self.x + 1, y: self.y) {
                if box.moveBox(direction: direction) {
                    self.x += 1
                    break
                } else {
                    print("Ход не возможен")
                    break
                }
            }
            self.x += 1
        case .Up where Room.checkCoord(x: self.x, y: self.y + 1):
            if checkCoordBox(box, x: self.x, y: self.y + 1) {
                if box.moveBox(direction: direction) {
                    self.y += 1
                    break
                } else {
                    print("Ход не возможен")
                    break
                }
            }
            self.y += 1
        case .Down where Room.checkCoord(x: self.x, y: self.y - 1):
            if checkCoordBox(box, x: self.x, y: self.y - 1) {
                if box.moveBox(direction: direction) {
                    self.y -= 1
                    break
                } else {
                    print("Ход не возможен")
                    break
                }
            }
            self.y -= 1
        default:
            print("Ход не возможен")
            break
        }
    }
    func checkCoordBox(_ box: Box, x: Int, y: Int) -> Bool {
        box.x == x && box.y == y ? true : false
    }
}



var room = Room()
var box = Box(x: 2, y: 4)
var duck = Person()

duck

room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Right, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Up, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Up, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Up, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Left, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Up, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Right, box: box)
room.printRoomAnd(person: duck, and: box)
duck.movePersonBy(direction: .Right, box: box)
room.printRoomAnd(person: duck, and: box)


//duck.movePersonBy(direction: .Down, box: <#Box#>)
//room.printRoom(and: duck)


//: [Next](@next)
