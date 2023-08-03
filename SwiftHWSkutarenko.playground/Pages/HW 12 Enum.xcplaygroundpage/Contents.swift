//: [Previous](@previous)

import Foundation

// 1. Создать enum с шахматными фигурами каждый кейс должен иметь ассоциативные значения - цвет, буква колонки и цифра ряда (позиция). Инициализировать несколько фигур, поместить их на доску, чтобы черному королю был мат
typealias Position = (x: Character, y: Int)
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
    case figure(name: Name, color: Color, position: Position)
    
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
typealias FigureInfo = (n: Figure.Name, c: Figure.Color, p: Position)

func getFigureInfo(for figure: Figure) -> FigureInfo {
    var temp: FigureInfo
    switch figure {
    case let .figure(name, color, position):
        temp = (name, color, position)
    }
    return temp
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
        let temp = getFigureInfo(for: figure)
        if "abcdefgh".contains(temp.p.x) && 1...8 ~= temp.p.y {
            board[String(temp.p.x) + String(temp.p.y)] = figure
        } else {
            print("Неверные координты фигуры \(temp.n) \(temp.c)")
        }
    }
    print("  a b c d e f g h")
    for y in [8, 7, 6, 5, 4, 3, 2, 1] {
        print(y, terminator: " ")
        for (i, x) in "abcdefgh".enumerated() {
            guard let figure = board["\(x)\(y)"] else {
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
printBattlefield(figures: figures)

// 4. Создать функцию которая будет принимать шахматную фигуру и второй параметр тюпл новой позиции на шахматной доске. Функция должна определять легален ли этот ход и если не легален не двигать фигуру (координаты за пределми доски, фигура так не ходит). Для нескольких фигур вызвать этуу функцию и распечатать доску с новым расположением фигур



func makeAMove(figure: inout Figure, new pos: (x: Character, y: Int)) {
    guard "abcdefgh".contains(pos.x), 1...8 ~= pos.y else {
        print("Введены некорректные координаты")
        return
    }
    var temp = getFigureInfo(for: figure)
    
    func kingMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(pos.x.asciiValue!)) == 1 && y == pos.y:
            fallthrough
        case let (x, y) where abs(y - pos.y) == 1 && x == pos.x:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue!) - Int(pos.x.asciiValue!)) == 1 && abs(y - pos.y) == 1:
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
  
    func horseMove(_ x: Character, _ y: Int) -> Bool {
        switch (x, y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(pos.x.asciiValue!)) == 2 && abs(y - pos.y) == 1:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue!) - Int(pos.x.asciiValue!)) == 1 && abs(y - pos.y) == 2:
            return true
        default:
            return false
        }
    }
    
    switch figure {
    case .figure(.king, _, _) where kingMove(temp.p.x, temp.p.y):
        fallthrough
    case .figure(.queen, _, _) where rookMove(temp.p.x, temp.p.y) || elephantMove(temp.p.x, temp.p.y):
        fallthrough
    case .figure(.rook, _, _) where rookMove(temp.p.x, temp.p.y):
        fallthrough
    case .figure(.elephant, _, _) where elephantMove(temp.p.x, temp.p.y):
        fallthrough
    case .figure(.horse, _, _) where horseMove(temp.p.x, temp.p.y):
        figure = .figure(name: temp.n, color: temp.c, position: (pos.x, pos.y))
    default:
        print("\(temp.n) \(temp.c) так не ходит")
        break
    }
}

makeAMove(figure: &figures[0], new: (x: "h", y: 1))
printBattlefield(figures: figures)
makeAMove(figure: &figures[1], new: (x: "c", y: 8))
printBattlefield(figures: figures)


//: [Next](@next)
