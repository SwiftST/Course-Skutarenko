//: [Previous](@previous)

import Foundation

/* SWIFT - 03. Тюплы
 
 1. Создать тюпл с тремя параметрами:

 - максимальное количество отжиманий
 - максимальное количество подтягиваний
 - максимальное количество приседаний

 Заполните его своими достижениями :) Распечатайте его через print()


 2. Также сделайте три отдельных вывода в консоль для каждого параметра& При том одни значения доставайте по индексу, а другие по параметру


 3. Создайте такой же тюпл для другого человека (супруги или друга) с такими же параметрами, но с другими значениями& Используйте промежуточную переменную чтобы поменять соответствующие значения. Первого тюпла на значения второго


 4. Создайте третий тюпл с теми же параметрами, но значения это разница между соответствующими значениями первого и второго тюплов. Результат выведите в консоль
 */

// 1
let myResults = (pushUps: 33, pullUps: 10, sitUps: 30)

// 2
print("My results:\n" +
      "1.maximum number of push-ups - \(myResults.pushUps)\n" +
      "2.maximum number of pull-ups - \(myResults.1)\n" +
      "3.maximim number of sit-ups - \(myResults.sitUps)")

// 3
var tempTuple = myResults
tempTuple.pushUps = 25
tempTuple.pullUps = 5
tempTuple.sitUps = 40
let wifeResults = tempTuple
print("My wife results:\n" +
      "1.maximum number of push-ups - \(wifeResults.pushUps)\n" +
      "2.maximum number of pull-ups - \(wifeResults.1)\n" +
      "3.maximim number of sit-ups - \(wifeResults.sitUps)")

// 4
let differenceWithUs = (pushUps: myResults.0 - wifeResults.0, pullUps: myResults.1 - wifeResults.1, sitUps: myResults.2 - wifeResults.2)
print("Difference between us:")

if differenceWithUs.pushUps > 0 {
    print("1.I push up \(differenceWithUs.pushUps) times more than wife")
} else if differenceWithUs.pushUps == 0 {
    print("1.We push up the same number of times")
} else {
    print("1.I push up \(abs(differenceWithUs.pushUps)) times less than wife")
}
if differenceWithUs.pullUps > 0 {
    print("2.I pull up \(differenceWithUs.pullUps) times more than wife")
} else if differenceWithUs.pullUps == 0 {
    print("2.We pull up the same number of times")
} else {
    print("2.I pull up \(abs(differenceWithUs.pullUps)) times less than wife")
}
if differenceWithUs.sitUps > 0 {
    print("3.I squat \(differenceWithUs.sitUps) times more than wife")
} else if differenceWithUs.sitUps == 0 {
    print("3.We squat the same number of times")
} else {
    print("3.I squat \(abs(differenceWithUs.sitUps)) times less than wife")
}


//: [Next](@next)
