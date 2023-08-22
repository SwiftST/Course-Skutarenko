//: [Previous](@previous)

import Foundation

// MARK: Subscripts

// 1. Создать тип шахматная доска, при обращению по сабскрипту по номеру столбца и букве ряда мы должны узнать цвет ячейки (реализовать через енум), в сабскрипте использовать только геттер. Если выбрана цифра и буква за пределами диапазона, то возвращать nil

struct ChessBoard {
    enum Color: String {
        case White, Black
    }
    
    var row: Character {
        didSet {
            guard "abcdefgh".contains(row) else {
                print("Введите коректные координаты")
                row = oldValue
                return
            }
        }
    }
    var column: Int {
        didSet {
            guard 1...8 ~= column else {
                print("Введите коректные координаты")
                column = oldValue
                return
            }
        }
    }
    
    subscript(row: Character, column: Int) -> Color? {
        guard "abcdefgh".contains(row) && 1...8 ~= column else {
            print("Координаты за предалами поля")
            return nil
        }
        return (Int(row.asciiValue!) + column) % 2 == 0 ? Color.Black : Color.White
        
    }
}

var example = ChessBoard(row: "a", column: 1)
example["q", 5]
example[example.row, example.column]
example.row = "1"
example.row


// 2. Игра крестики нолики. Создать поле для крестиков ноликов, создать енум (ячейка), который должен содержать (крестик, нолик либо пусто). Добавить возможность красиво распечатать поле, чтобы было видно где крестики и нолики. По сабскрипту мы должны обращаться к какой то определенной ячейке и устанавливать ей крестик или нолик. Если выбрана ячейка за пределами поля возвращать nil. При задании в ячейку пользователь не должен записать пусто. Если в определенной ячейке уже стоит крестик или нолик человек не должно быть возможнеости их установить. Реализовать адгоритм, который будет определять победителя

struct TicTacToe {
    static let defaultBoard: [Coordinate : Cell] = {
        var temp: [Coordinate : Cell] = [:]
        for x in 1...3 {
            for y in 1...3 {
                temp[Coordinate(x: x, y: y)] = Cell.Empty
            }
        }
        return temp
    }()
    
    enum Cell: String {
        case Cross = "✖︎", Zero = "○", Empty = "■"
    }
    
    struct Coordinate: Hashable {
        var x: Int
        var y: Int
    }
        
    var board: [Coordinate : Cell] = defaultBoard {
        didSet(oldValue) {
            guard board.count == oldValue.count else {
                board = oldValue
                print("Удалять/Добавлять ячейки невозможно")
                return
            }
        }
    }
    var isWin = false
    var counter = 0
    
    subscript(x: Int, y: Int) -> Cell? {
        get {
            guard 1...3 ~= x, 1...3 ~= y else {
                return nil
            }
            return board[Coordinate(x: x, y: y)]
        }
        set(newValue) {
            guard 1...3 ~= x, 1...3 ~= y else {
                print("Координаты за пределами поля")
                return
            }
            guard newValue != .Empty else {
                print("Повторите ввод")
                return
            }
            guard board[Coordinate(x: x, y: y)] == .Empty else {
                print("Повторите ввод")
                return
            }
            board[Coordinate(x: x, y: y)] = newValue
        }
    }
    
    func printBoard() {
        for x in 1...3 {
            for y in 1...3 {
                print(board[Coordinate(x: x, y: y)].self!.rawValue, terminator: " ")
            }
            print("")
        }
    }
    
    mutating func newGame() {
        board = Self.defaultBoard
    }
    
    func winner() -> Bool {
        
        return false
    }
}

var someTicTac = TicTacToe()


while someTicTac.board.values.contains(.Empty) || someTicTac.isWin {
    var player = TicTacToe.Cell.Cross
    if someTicTac.counter % 2 == 0 {
        print("Ход первого игрока (Cross)")
    } else {
        print("Ход второго игрока (Zero)")
        player = .Zero
    }
    someTicTac.counter += 1
}





someTicTac.board.count
someTicTac.board
someTicTac.printBoard()
someTicTac[1, 4] = .Zero
someTicTac[1, 4]
someTicTac.board[TicTacToe.Coordinate(x: 1, y: 4)] = .Cross
someTicTac.board[TicTacToe.Coordinate(x: 1, y: 5)]
someTicTac.board.count
someTicTac[1, 2] = .Cross
someTicTac[1, 2]
someTicTac[1, 2] = .Empty
someTicTac[1, 2]
someTicTac.board[TicTacToe.Coordinate(x: 1, y: 2)]
someTicTac.printBoard()
someTicTac.newGame()


// 3. Морской бой. Начнем с корабля у которого своя локальная система координат (одномерная), координата на поле + его ширина и высота. Он должен вычислять свое состояние (умер или нет). Сделать поле для игры морской бой, если кто то пытается выстрелить мимо поля, должны сделать правильные действия при этом. Когда делается выстрел по полю мы должны проверять попал ли он в корабль и если попал то переводить в его локальную систему координат (его собственный сабскрипт) и узнать умер корабль или нет. Корабль должен сохранять все выстрелы, которые в него попали. Сделать пару выстрелов мимо и убить четырехпалубник. Красиво распечатать эти ходы

//: [Next](@next)
