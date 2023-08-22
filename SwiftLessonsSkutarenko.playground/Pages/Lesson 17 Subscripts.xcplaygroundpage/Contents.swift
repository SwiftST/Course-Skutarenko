//: [Previous](@previous)

import Foundation

// MARK: Subscripts

let array = ["a", "b", "c"]
array[0]
array[1]
array[2]

// Сабскрипт - обращение к экземпляру через синтаксис квадратных скобок (синтаксис сабскриптов)
// Сабскрипты возможно применять к классам, структурам и енумам

struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["kid1", "kid2", "kid3"]
    
    var count: Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0:
                return father
            case 1:
                return mother
            case 2..<(kids.count + 2):
                return kids[index - 2]
            default:
                return nil
            }
        }
        set(newValue) {
            let value = newValue ?? ""
            switch index {
            case 0:
                return father = value
            case 1:
                return mother = value
            case 2..<(kids.count + 2):
                return kids[index - 2] = value
            default:
                break
            }
        }
        
    }
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
    
    
    
    
}

var family = Family()
family.father
family.mother
family.kids[0]

family.count

family[1]
family[2]
family[5]

family[0] = "Daddy"
family[3] = "Buddy"
family.kids[1]
family[3]
family[3, "the great"]

struct Field {
    var dict: [String: String] = [:]
    
    private func keyFor(column: String, and row: Int) -> String {
        return column + String(row)
    }
    
    subscript(column: String, row: Int) -> String? {
        get {
            return dict[keyFor(column: column, and: row)]
        }
        set {
            dict[keyFor(column: column, and: row)] = newValue
        }
    }
}

var field = Field()

field["a", 5]
field["a", 5] = "X"
field["a", 5]




//: [Next](@next)
