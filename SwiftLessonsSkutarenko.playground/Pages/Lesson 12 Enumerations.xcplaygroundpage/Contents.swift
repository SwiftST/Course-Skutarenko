//: [Previous](@previous)

import Foundation

// MARK: Enum

enum Action {
    enum Direction: String {
        case left = "Left!"
        case right = "Right!"
    }
    case walk(meters: Int)
    case run(meters: Int, speed: Double)
    case stop
    case turn(direction: Direction)
}

var action = Action.run(meters: 30, speed: 15)
//action = .stop
//action = .walk(meters: 10)


switch action {
case .stop:
    print("Stop")
case .walk(let meters) where meters < 100:
    print("short walk")
case .walk(let meters):
    print("walk \(meters) meters")
case .run(let meters, let speed):
    print("run \(meters) meters with speed \(speed)")
case .turn(let dir) where dir == .left:
    print("Turn left")
case .turn:
    print("Turn right")
}
print(Action.Direction.left.rawValue)


var direction = Action.Direction(rawValue: "Right!")!


action = .turn(direction: direction)



//: [Next](@next)
