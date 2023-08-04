//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// 1. Создать enum с шахматными фигурами каждый кейс должен иметь ассоциативные значения - цвет, буква колонки и цифра ряда (позиция). Инициализировать несколько фигур, поместить их на доску, чтобы черному королю был мат

class Figure {
    typealias Position = (x: Character, y: Int)
    
    enum Name: String, CaseIterable {
        case king, queen, rook, elephant, horse, pawn
    }
    
    enum Color: String {
        case white, black
    }
  
    var name: Name
    var color: Color
    var position: Position {
        didSet {
            guard "abcdefgh".contains(position.x) && 1...8 ~= position.y else {
                position.x = oldValue.x
                position.y = oldValue.y
                print("Введены не корректные координаты")
                return
            }
        }
    }
    
    var label: String {
        var startIndex = 0x2654 + Name.allCases.firstIndex(of: name)!
        startIndex += color == .white ? 0 : Name.allCases.count
        return String(UnicodeScalar(startIndex)!)
    }
    
    init(name: Name, color: Color, _ position: Position) {
        self.name = name
        self.color = color
        self.position = position
    }
    
    func makeAMove(x: Character, y: Int) {
        guard "abcdefgh".contains(x) && 1...8 ~= y else {
            print("Введены не корректные координаты")
            return
        }
        switch name {
        case .king where kingMove(x, y):
            fallthrough
        case .queen where rookMove(x, y) || elephantMove(x, y):
            fallthrough
        case .rook where rookMove(x, y):
            fallthrough
        case .elephant where elephantMove(x, y):
            fallthrough
        case .horse where horseMove(x, y):
            print("\(name) \(color) \(position.x)\(position.y) -> \(x)\(y)")
            position.x = x
            position.y = y
        default:
            print("\(name) \(color) так не ходит")
        }
    }
    private func kingMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 1 && y == position.y:
            fallthrough
        case let (x, y) where abs(y - position.y) == 1 && x == position.x:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 1 && abs(y - position.y) == 1:
            return true
        default:
            return false
        }
    }
    
    private func rookMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where x == position.x && (y > position.y || y < position.y):
            fallthrough
        case let (x, y) where y == position.y && (x > position.x || x < position.x):
            return true
        default:
            return false
        }
    }
    
    private func elephantMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where Int(x.asciiValue!) + y == Int(position.x.asciiValue!) + position.y:
            fallthrough
        case let (x, y) where Int(x.asciiValue!) - y == Int(position.x.asciiValue!) - position.y:
            return true
        default:
            return false
        }
    }
  
    private func horseMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 2 && abs(y - position.y) == 1:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 1 && abs(y - position.y) == 2:
            return true
        default:
            return false
        }
    }
}
let kingBlack = Figure(name: .king, color: .black, ("a", 8))
let queenWhite = Figure(name: .queen, color: .white, ("a", 1))
let rookWhite = Figure(name: .rook, color: .white, ("b", 2))

// 2. Положить все созданные фигуры в массив. В enum сделать rawValue - String название фигуры. Создать одну функцию которая принимает фигуру и через принт выводит тип этой фигуры, цвет и позицию. Создать еще одну функцию которая принимает массив фигур, проходится по нему и вызывает первую функцию

var figures = [kingBlack, queenWhite, rookWhite]

func printFigure(for figures: [Figure]) {
    for figure in figures {
        print(figure.name.rawValue + " " + figure.color.rawValue + " position: " + String(figure.position.x) + String(figure.position.y))
    }
}
printFigure(for: figures)

// 3. Создать функцию которая будет рисовать доску. Она будет принимать массив фигур и рисовать шахматную доску.

func printBattlefield(figures: [Figure]) {
    
}
struct Board {
    var figures: [Figure]
    var battlefield: [String: Figure] {
        var temp: [String: Figure] = [:]
        for figure in figures {
            temp["\(figure.position.x)\(figure.position.y)"] = figure
        }
        return temp
    }
    func printBoard() {
        print("  a b c d e f g h")
        for y in [8, 7, 6, 5, 4, 3, 2, 1] {
            print(y, terminator: " ")
            for (i, x) in "abcdefgh".enumerated() {
                guard let figure = battlefield["\(x)\(y)"] else {
                    print((i + y) % 2 == 0 ? "■" : "□", terminator: " ")
                    continue
                }
                print(figure.label, terminator: " ")
            }
            print(y, terminator: " ")
            print("")
        }
        print("  a b c d e f g h")
    }
}

var board = Board(figures: figures)
board.printBoard()
figures[0].makeAMove(x: "a", y: 7)
board.printBoard()
printFigure(for: figures)


// 4. Создать функцию которая будет принимать шахматную фигуру и второй параметр тюпл новой позиции на шахматной доске. Функция должна определять легален ли этот ход и если не легален не двигать фигуру (координаты за пределми доски, фигура так не ходит). Для нескольких фигур вызвать этуу функцию и распечатать доску с новым расположением фигур
