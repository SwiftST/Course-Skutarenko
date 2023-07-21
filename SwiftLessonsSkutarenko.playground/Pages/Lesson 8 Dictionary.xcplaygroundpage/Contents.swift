//: [Previous](@previous)

import Foundation
// let dict: [String: String] = ["машина": "Car", "мужик": "Man"]
// let dict2: [Int: String] = [0: "Car, 1: "Man]
// let dict3: Dictionary<String,String> = ["машина": "Car", "мужик": "Man"]
var dict = [
    "машина": "Car",
    "мужик": "Man"
]

dict["мужик"]
dict["комп"] = "Computer"

//dict["комп"] = "Mac"
dict.updateValue("Mac", forKey: "комп")

if let comp = dict["комп"] {
    print(comp)
} else {
    print("no value for key")
}

// dict["мужик"] = nil
// dict

dict.removeValue(forKey: "мужик")

for key in dict.keys {
    print("key = \(key) value = \(dict[key]!)")
}
for (key, value) in dict {
    print("key = \(key) value = \(value)")
}
dict["комп"] = nil
dict = [:]
dict.isEmpty
type(of: dict)


//: [Next](@next)
