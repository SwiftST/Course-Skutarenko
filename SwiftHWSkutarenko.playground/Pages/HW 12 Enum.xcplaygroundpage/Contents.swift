//: [Previous](@previous)

import Foundation

// 1. Создать enum с шахматными фигурами каждый кейс должен иметь ассоциативные значения - цвет, буква колонки и цифра ряда (позиция). Инициализировать несколько фигур, поместить их на доску, чтобы черному королю был мат

enum Figure {
    enum Name: String, CaseIterable {
        case king
        case queen
        case rook
        case elephant
        case horse
        case pawn
    }
    enum Color: String {
        case white
        case black
    }
    case figure(name: Name, color: Color, position: (Character, Int))
    
    var label: String {
        var startIndex = 0x2654
        switch self {
        case let .figure(name, color, _):
            startIndex += Self.Name.allCases.firstIndex(of: name)!
            startIndex += color == .white ? 0 : 6
        }
        return String(Unicode.Scalar(UnicodeScalar(startIndex)!))
    }
}

var queenWhite: Figure = .figure(name: .queen, color: .white, position: ("a", 1))
var kingBlack: Figure = .figure(name: .king, color: .black, position: ("a", 8))
var rookWhite: Figure = .figure(name: .rook, color: .white, position: ("b", 3))

// 2. Положить все созданные фигуры в массив. В enum сделать rawValue - String название фигуры. Создать одну функцию которая принимает фигуру и через принт выводит тип этой фигуры, цвет и позицию. Создать еще одну функцию которая принимает массив фигур, проходится по нему и вызывает первую функцию

var figures: [Figure] = [queenWhite, kingBlack, rookWhite]

func printFigures(figures: [Figure]) {
    for figure in figures {
        switch figure {
        case let .figure(name, color, position):
            print("\(figure.label) \(name.rawValue) \(color.rawValue) position: \(position.0)\(position.1)")
        }
    }
}
printFigures(figures: figures)

// 3. Создать функцию которая будет рисовать доску. Она будет принимать массив фигур и рисовать шахматную доску.



func printBattlefield(figures: [Figure]) {
    var board: [String : Figure] = [:]
    for figure in figures {
        switch figure {
        case .figure(_, _, let position) where "abcdefgh".contains(position.0) && 1...8 ~= position.1  :
            board[String(position.0) + String(position.1)] = figure
        case let .figure(name, color, _):
            print("Неверные координты фигуры \(name) \(color)")
        }
    }
    
    for y in [8, 7, 6, 5, 4, 3, 2, 1] {
        for (i, x) in "abcdefgh".enumerated() {
            guard let figure = board["\(x)\(y)"] else {
                print((i + y) % 2 == 0 ? "■" : "□", terminator: " ")
                continue
            }
            print(figure.label, terminator: " ")
        }
        print("")
    }
    print("")
}
printBattlefield(figures: figures)

// 4. Создать функцию которая будет принимать шахматную фигуру и второй параметр тюпл новой позиции на шахматной доске. Функция должна определять легален ли этот ход и если не легален не двигать фигуру (координаты за пределми доски, фигура так не ходит). Для нескольких фигур вызвать этуу функцию и распечатать доску с новым расположением фигур

func makeAMove(figure: inout Figure, new pos: (x: Character, y: Int)) {
    guard "abcdefgh".contains(pos.x), 1...8 ~= pos.y else {
        print("Введены некорректные координаты")
        return
    }
    
    func kingMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where abs(Int(x.asciiValue! - pos.x.asciiValue!)) == 1 && y == pos.y:
            fallthrough
        case let (x, y) where abs(y - pos.y) == 1 && x == pos.x:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue! - pos.x.asciiValue!)) == 1 && abs(y - pos.y) == 1:
            return true
        default:
            return false
        }
    }
    
    func rookMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where x == pos.x && (y > pos.y || y < pos.y):
            fallthrough
        case let (x, y) where y == pos.y && (x > pos.x || x < pos.x):
            return true
        default:
            return false
        }
    }
    
    func elephantMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where Int(x.asciiValue!) + y == Int(pos.x.asciiValue!) + pos.y:
            fallthrough
        case let (x, y) where Int(x.asciiValue!) - y == Int(pos.x.asciiValue!) - pos.y:
            return true
        default:
            return false
        }
    }
    
    func queenMove(_ x: Character, _ y: Int) -> Bool {
        elephantMove(x, y) || rookMove(x, y)
    }
    
    func horseMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where abs(Int(x.asciiValue! - pos.x.asciiValue!)) == 2 && abs(y - pos.y) == 1:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue! - pos.x.asciiValue!)) == 1 && abs(y - pos.y) == 2:
            return true
        default:
            return false
        }
    }
    
    switch figure {
    case let .figure(name, color, (x, y)) where name == .king && kingMove(x, y):
        fallthrough
    case let .figure(name, color, (x, y)) where name == .queen && queenMove(x, y):
        fallthrough
    case let .figure(name, color, (x, y)) where name == .rook && rookMove(x, y):
        fallthrough
    case let .figure(name, color, (x, y)) where name == .elephant && elephantMove(x, y):
        fallthrough
    case let .figure(name, color, (x, y)) where name == .horse && horseMove(x, y):
        figure = .figure(name: name, color: color, position: (pos.x, pos.y))
    default:
        print("Так не ходят")
        break
    }
}

makeAMove(figure: &figures[0], new: (x: "h", y: 1))
printBattlefield(figures: figures)











//: [Next](@next)
