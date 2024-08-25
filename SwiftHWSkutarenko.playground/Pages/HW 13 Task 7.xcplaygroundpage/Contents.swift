//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// 1. Создать enum с шахматными фигурами каждый кейс должен иметь ассоциативные значения - цвет, буква колонки и цифра ряда (позиция). Инициализировать несколько фигур, поместить их на доску, чтобы черному королю был мат

class Figure {
    typealias Coord = (x: Character, y: Int)
    
    enum Name: String, CaseIterable {
        case king, queen, rook, bishop, horse, pawn
    }
    
    enum Color: String {
        case white, black
    }
    
    var name: Name
    var color: Color
    var position: Coord
    
    var label: String {
        var startIndex = Int(UInt32(UnicodeScalar("♔"))) + Name.allCases.firstIndex(of: name)!
        startIndex += color == .black ? 6 : 0
        return String(Unicode.Scalar(startIndex)!)
    }
    
    init(name: Name, color: Color, position: Coord) {
        self.name = name
        self.color = color
        self.position = position
    }
    
    func makeAMove(new coord: Coord) {
        guard  "a"..."h" ~= coord.x, 1...8 ~= coord.y else {
            print("Введены некоректные координаты")
            return
        }
        switch name {
        case .king where kingMove(coord: coord):
            fallthrough
        case .queen where rookMove(coord: coord) || bishopMove(coord: coord):
            fallthrough
        case .rook where rookMove(coord: coord):
            fallthrough
        case .bishop where bishopMove(coord: coord):
            fallthrough
        case .horse where horseMove(coord: coord):
            fallthrough
        case .pawn where pawnMove(coord: coord):
            print("\(name) \(color) \(position.x)\(position.y) -> \(coord.x)\(coord.y)")
            position = coord
        default:
            print("\(name) \(color) так не ходит" )
        }
    }
    
    private func kingMove(coord: Coord) -> Bool {
        switch (coord.x, coord.y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 1 && y == position.y:
            fallthrough
        case let (x, y) where abs(y - position.y) == 1 && x == position.x:
            fallthrough
        case let (x, y) where abs(y - position.y) == 1 && abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 1:
            return true
        default:
            return false
        }
    }
    
    private func rookMove(coord: Coord) -> Bool {
        switch (coord.x, coord.y) {
        case let (x, y) where x == position.x && y != position.y:
            fallthrough
        case let (x, y) where x != position.x && y == position.y:
            return true
        default:
            return false
        }
    }
    
    private func bishopMove(coord: Coord) -> Bool {
        guard abs(Int(coord.x.asciiValue!) - Int(position.x.asciiValue!)) == abs(coord.y - position.y) else {
            return false
        }
        return true
    }
    
    private func horseMove(coord: Coord) -> Bool {
        switch (coord.x, coord.y) {
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 1 && abs(y - position.y) == 2:
            fallthrough
        case let (x, y) where abs(Int(x.asciiValue!) - Int(position.x.asciiValue!)) == 2 && abs(y - position.y) == 1:
            return true
        default:
            return false
        }
    }
    
    private func pawnMove(coord: Coord) -> Bool {
        switch (coord.x, coord.y, color) {
        case let (x, y, .white) where position.y == 2 && (x == position.x && (1...2).contains(y - position.y)):
            fallthrough
        case let (x, y, .white) where x == position.x && y == position.y + 1:
            fallthrough
        case let (x, y, .black) where position.y == 7 && (x == position.x && (1...2).contains(position.y - y)):
            fallthrough
        case let (x, y, .black) where x == position.x && y == position.y - 1:
            return true
        default:
            return false
        }
    }
}

let kingBlack = Figure(name: .king, color: .black, position: ("a", 8))
let queenWhite = Figure(name: .queen, color: .white, position: ("a", 1))
let rookWhite = Figure(name: .rook, color: .white, position: ("b", 2))

// 2. Положить все созданные фигуры в массив. В enum сделать rawValue - String название фигуры. Создать одну функцию которая принимает фигуру и через принт выводит тип этой фигуры, цвет и позицию. Создать еще одну функцию которая принимает массив фигур, проходится по нему и вызывает первую функцию

var figures = [kingBlack, queenWhite, rookWhite]

func getInfo(for figures: [Figure]) {
    for (i, figure) in figures.enumerated() {
        print("\(i + 1). \(figure.name) \(figure.color) - \(figure.position.x.uppercased())\(figure.position.y)")
    }
}
getInfo(for: figures)

// 3. Создать функцию которая будет рисовать доску. Она будет принимать массив фигур и рисовать шахматную доску.

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
                    print(((i + y) % 2 == 0) ? "■" : "□", terminator: " ")
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

var battlefield = Board(figures: figures)
battlefield.printBoard()
figures[0].makeAMove(new: (x: "a", y: 7))
figures[1].makeAMove(new: (x: "a", y: 9))
battlefield.printBoard()
getInfo(for: figures)


// 4. Создать функцию которая будет принимать шахматную фигуру и второй параметр тюпл новой позиции на шахматной доске. Функция должна определять легален ли этот ход и если не легален не двигать фигуру (координаты за пределми доски, фигура так не ходит). Для нескольких фигур вызвать этуу функцию и распечатать доску с новым расположением фигур
