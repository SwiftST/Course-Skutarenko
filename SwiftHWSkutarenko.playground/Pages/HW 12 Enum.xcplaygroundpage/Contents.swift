//: [Previous](@previous)

import Foundation

// 1. Создать enum с шахматными фигурами каждый кейс должен иметь ассоциативные значения - цвет, буква колонки и цифра ряда (позиция). Инициализировать несколько фигур, поместить их на доску, чтобы черному королю был мат
typealias Coord = (x: Character, y: Int)
enum Figure {
    enum Color: String {
        case white
        case black
    }
    enum Name: String, CaseIterable {
        case king, queen, rook, bishop, horse, pawn
    }
    case figure(name: Name, color: Color, coord: Coord)
    
}

func getLabel(for figure: Figure) -> String {
    var startIndex = 0x2654
    switch figure {
    case let .figure(name, color, _):
        startIndex += Figure.Name.allCases.firstIndex(of: name)!
        startIndex += color == .white ? 0 : 6
    }
    return String(Unicode.Scalar(startIndex)!)
}

var blackKing = Figure.figure(name: .king, color: .black, coord: ("h", 8))
var whiteQueen = Figure.figure(name: .queen, color: .white, coord: ("h", 3))
var whiteRook = Figure.figure(name: .rook, color: .white, coord: ("g", 5))

/*
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
*/


// 2. Положить все созданные фигуры в массив. В enum сделать rawValue - String название фигуры. Создать одну функцию которая принимает фигуру и через принт выводит тип этой фигуры, цвет и позицию. Создать еще одну функцию которая принимает массив фигур, проходится по нему и вызывает первую функцию

var figures = [blackKing, whiteQueen, whiteRook]

func printFigure(_ figures: [Figure]) {
    for figure in figures {
        switch figure {
        case let .figure(name, color, coord):
            print("Figure: \(color.rawValue) \(name.rawValue), x: \(coord.x), y: \(coord.y)")
        }
    }
}
printFigure(figures)

// 3. Создать функцию которая будет рисовать доску. Она будет принимать массив фигур и рисовать шахматную доску.


func printChess(for figures: [Figure]) {
    var temp: [String: Figure] = [:]
    for figure in figures {
        switch figure {
        case let .figure(name, color, coord):
            temp["\(coord.x)\(coord.y)"] = figure
        }
    }
    for x in (1...8).reversed() {
        print(x, terminator: " ")
        for (i, y) in "abcdefgh".enumerated() {
            guard let figure = temp["\(y)\(x)"] else {
                print((x + i) % 2 == 1 ? "◻︎" : "◼︎", terminator: " ")
                continue
            }
            print(getLabel(for: figure), terminator: " ")
        }
        print()
    }
    print("  a b c d e f g h")
}

printChess(for: figures)

// 4. Создать функцию которая будет принимать шахматную фигуру и второй параметр тюпл новой позиции на шахматной доске. Функция должна определять легален ли этот ход и если не легален не двигать фигуру (координаты за пределми доски, фигура так не ходит). Для нескольких фигур вызвать этуу функцию и распечатать доску с новым расположением фигур

typealias FigureInfo = (name: Figure.Name, color: Figure.Color, coord: Coord)
func getFigureInfo(for figure: Figure) -> FigureInfo {
    switch figure {
    case let .figure(name, color, coord):
        return (name, color, coord)
    }
}
func moveTheFigure(_ figure: inout Figure, on coord: Coord) {
    guard 1...8 ~= coord.y, "a"..."h" ~= coord.x else {
        print("Некорректные координаты")
        return
    }
    var temp = getFigureInfo(for: figure)
    let (oldX, oldY) = (temp.coord.x, temp.coord.y)
    
    func kingMove() -> Bool {
        switch (coord.x, coord.y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(oldX.asciiValue!)) == 1 && y == oldY:
            fallthrough
        case let (x, y) where abs(y - oldY) == 1 && x == oldX:
            fallthrough
        case let (x, y) where abs(y - oldY) == 1 && abs(Int(x.asciiValue!) - Int(oldX.asciiValue!)) == 1:
            return true
        default:
            return false
        }
    }
    
    func rookMove() -> Bool {
        switch (coord.x, coord.y) {
        case let (x, y) where x == oldX && y != oldY:
            fallthrough
        case let (x, y) where x != oldX && y == oldY:
            return true
        default:
            return false
        }
    }
    
    func bishopMove() -> Bool {
        guard abs(Int(coord.x.asciiValue!) - Int(oldX.asciiValue!)) == abs(coord.y - oldY) else {
            return false
        }
        return true
    }
    
    func horseMove() -> Bool {
        switch (coord.x, coord.y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(oldX.asciiValue!)) == 1 && abs(y - oldY) == 2:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue!) - Int(oldX.asciiValue!)) == 2 && abs(y - oldY) == 1:
            return true
        default:
            return false
        }
    }
    
    func pawnMove() -> Bool {
        switch (coord.x, coord.y, temp.color) {
        case let (x, y, .white) where oldY == 2 && (x == oldX && (1...2).contains(y - oldY)):
            fallthrough
        case let (x, y, .white) where x == oldX && y == oldY + 1:
            fallthrough
        case let (x, y, .black) where oldY == 7 && (x == oldX && (1...2).contains(oldY - y)):
            fallthrough
        case let (x, y, .black) where x == oldX && y == oldY - 1:
            return true
        default:
            return false
        }
    }
    
    switch figure {
    case .figure(name: .king, _, _) where kingMove():
        fallthrough
    case .figure(name: .queen, _, _) where bishopMove() || rookMove():
        fallthrough
    case .figure(name: .rook, _, _) where rookMove():
        fallthrough
    case .figure(name: .bishop, _, _) where bishopMove():
        fallthrough
    case .figure(name: .horse, _, _) where horseMove():
        fallthrough
    case .figure(name: .pawn, _, _) where pawnMove():
        figure = .figure(name: temp.name, color: temp.color, coord: coord)
        print("\(temp.name) \(temp.color) \(oldX)\(oldY) ходит на \(coord.x)\(coord.y)")
    default:
        print("\(temp.name) \(temp.color) так не ходит")
        break
    }
}

// неверные координаты
moveTheFigure(&figures[0], on: (x: "1", y: 1))
// легитимный ход (king black)
moveTheFigure(&figures[0], on: (x: "g", y: 7))
// печать поля
printChess(for: figures)
// неверный ход (rook white)
moveTheFigure(&figures[2], on: (x: "f", y: 6))
// легитимный ход (rook white)
moveTheFigure(&figures[2], on: (x: "c", y: 5))
// печать поля
printChess(for: figures)



//: [Next](@next)
