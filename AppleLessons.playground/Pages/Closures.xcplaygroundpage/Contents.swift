//: [Previous](@previous)

import Foundation

// MARK: Closures (замыкания)

// Замыкания могут захватывать и хранить ссылки на любые константы и переменные из контекста, в котором они объявлены. Эта процедура известна как заключение этих констант и переменных, отсюда и название "замыкание". Swift выполняет всю работу с управлением памятью при захвате за вас
// Захват - capturing

// Глобальные и вложенные функции, являются частаным случаем замыканий. Замыкания принимают одну из трех форм:
//  1. глобальные функции являются замыканиями, у которых есть имя и которые не захватывают никакие значения
//  2. вложенные функции являются замыканиями, у которых есть имя и которые моут захватывать значения из включающей их функции
//  3. выражения замыкания являются безимянными замыканиями, написанные в облегченном синтаксисе, которые могут захватывать значения из их окружающего контекста

// MARK: Замыкающие выражения

// Замыкающие выражения, являются способом написания встроенных замыканий через краткий и специализированный синтаксис. Замыкающие выражения обеспечивают несколько синтаксических оптимизаций для написания замыканий в краткой форме, без потери ясности и намерений.

// MARK: Метод sorted
// Метод soted(by:) сортирует массив значений определенного типа, основываясь на результате сортирующего замыканиями, которое ему передаем. После завершения сортировки, метод возвращает массив того же типа в правильном порядке сортировки. Исходный массив не изменяется
// (T, T) -> Bool

let names = ["Chris", "Anna", "Ewa", "Barry", "Dani"]
// один из методов передачи сортирующего замыкания в метод, написать функцию и передать в качестве аргумента в метод
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedName = names.sorted(by: backward)
print(reversedName)

// MARK: Синтаксис замыкающего выражения
// Синтаксис замыкающего выражения:
/*
 { ( параметры ) -> тип результата in
      выражения (тело замыкания)
 }
 */
// 1. Синтаксис замыкающего выражения позволяет использовать сквозные параметры (inout)
// 2. Значения по умолчанию не могут быть переданы
// 3. Вариатиыне параметры могут быть использованы в любом месте в списке параметров
// 4. Кортежи могуть использованы в качестве входных и возвращаемого пармаетров

reversedName = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
print(reversedName)

// MARK: Определение типа из контекста
// Поскольку сортирующее замыкание передается как аргумент метода, Swift может вывести типы его параметров и тип возвращаемого значения, через тип параметра метода sorted(by:)

reversedName = names.sorted(by: { s1, s2 in return s1 > s2 })

// MARK: Неявные возвращаемые значения из замыканий с однм выражением
// Зымыкания с одним выражением могут неявно возвращать результат своего выражения через опускания ключевого слова return из их объявления

reversedName = names.sorted(by: { s1, s2 in s1 > s2 })

// MARK: Сокращенные имена параметров
// Swift автоматически предоставляет сокращенные имена для однострочных замыканий, которые могут быть использованы для обращения к значениям параметров замыкания через имена $0, $1, $2 и т.д.

reversedName = names.sorted(by: { $0 > $1 })

// MARK: Операторные функции
// Тип String в Swift определяет свою специфичную для строк реализацию оператора больше (>) как функции, имеющей два строковых параметра и возвращающей значение типа Bool. Это точно соответствует типу метода sorted(by:)

reversedName = names.sorted(by: > )

// MARK: Последующее замыкание
// Последующее замыкание - замыкание которое записано в виде замыкающего выражения вне (и после) круглых скобок вызова функции, даже немотря на то, что оно все еще является аргументом функции.
// когда используется синтаксис последующего замыкания, то ярлык аргумента для последующего замыкания опускается
// функция может включать в себя несколько последующих замыканий

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // тело функции
}

// вызов функции без последующего замыкания
someFunctionThatTakesAClosure(closure: {
    // тело замыкания
})

// вызов функции с использованием последующего замыкания
someFunctionThatTakesAClosure() {
    // тело последующего замыкания
}

reversedName = names.sorted() { $0 > $1 }

// Если выражение замыкания является единственным аргументом, и мы его пишем используя синатксис последующего замыкания, то круглые скобки вызова самой функции можно опустить
reversedName = names.sorted { $0 > $1 }

// Последующие замыкания полезны, когда само замыкание достаточно длинное и его невозможно записать в одну строку


let digitNames = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine"
]
let numbers = [16, 58, 510]

var someNumbers = numbers.map { number in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print(someNumbers)

// если функция принимает несколько последующих замыканий, то при вызове можно опустить ярлык для первого из них, а для последующих уже нельзя

/*
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}
*/
// вызов функции
/*
loadPicture(from: someServer) { picture in
     someView.currentPicture = picture
 } onFailure: {
     print("Couldn't download the next picture.")
}
*/

// MARK: Захват значений
// Замыкания могут захватывать константы и переменные из окружающего контекста, в котором оно было объявлено. После захвата замыкание может ссылаться или модифицировать значения этих констант и переменных внутри своего тела, даже если область, в которой были объявлены эти константы или переменные больше не существует
// Вложенная функция может захватывать аргументы окружающей ее функции, а так же константы и переменнные объявленные в теле внешней функции

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// В качестве оптимизации Swift может захватить и хранить копию значения, если это значение не изменяется самим замыканием, а так же не изменяется после того, как замыкание было создано. Swift также берет на себя управление памятью по утилизации переменных, когда они более не нужны.

let incrementByTen = makeIncrement(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrement(forIncrement: 7)
incrementBySeven()
incrementBySeven()

// Если вы присваиваете замыкание свойству экземпяра класса, и замыкание захватывает этот экземпляр по ссылке на него или его члены, вы создаете сильные обратные связи между экземпляром и замыканием. Swift использует списки захвата, для разрыва этих сильных обратных связей

// MARK: Замыкания - ссылочный тип
// в примере выше incrementByTen и incrementBySeven константы, но замыкания, на которые ссылаются эти константы имеют возможность увеличивать значение переменных runningTotal, которые они захватили. Это из-за того, что функции и замыкания являются ссылочными типами

// Когда бы вы не присваивали функцию или замыкание константе или переменной, вы фактически присваиваете ссылку этой константе или переменной на эту функцию или замыкание.

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
incrementByTen()

// и та и другая функция ссылаются на одно замыкание, соответственно возвращают один и тот же runingTotal

// MARK: Сбегающие замыкания @escaping
// Когда говорят что замыкание сбегает из функции это значит, что это замыкание было передано в функцию в качестве аргумента и вызывается уже после того, как функция вернула значение.
// Если вы передаете в функцию в качестве аргумента замыкание которое может сбежать, то вы пишите @escaping до типа параметра
// Если замыкание хранится в переменной, которая была объявлена вне функции, а затем эта переменная была передана в функцию в качестве аргумента, то получается что замыкание которое посредством переменной передается в функцию, сбегающее. В качестве примера можно расмотреть функции, которые выпоняют ассинхроннные операции в завершающем обработчике, который является замыканием. То есть получается, что функция завершает свою работу после чего вызывается завершающий обработчик. Другими словами обработчик не вызывается пока не завершится работа функции, таким образом получается что данному замыканию нужно сбежать из области функции чтобы отработать позже

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x += 1 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
instance.x = 1
instance.x
completionHandlers.first?()
instance.x
// Prints "100"

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instanceOne = SomeOtherClass()
instanceOne.x
instanceOne.doSomething()
instanceOne.x
completionHandlers[1]()
instanceOne.x

// MARK: Автозамыкания (@autoclosure)
// Автозамыкания - замыкания, которые автоматически создаются для заключения выражения, которое было передано в качестве аргумента функции. Такие замыкания не принимают никаких аргументов при вызове и возвращают значение выражения, которое заключено внутри нее. Синтаксически вы можете опустить круглые скобки функции вокруг параметров функции, просто записав обычное выражение вместо явного замыкания.

// Пример отображает как замыкания откладывают действия
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Выведет "5"
 
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
type(of: customerProvider)
// Выведет "5"
 
print("Now serving \(customerProvider())!")
// Выведет "Now serving Chris!"
print(customersInLine.count)
// Выведет "4"

// такое же поведение внутри функции
// customersInLine равен ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

// Функция serve(customer:) описанная выше принимает явное замыкание, которое возвращает имя клиента. Версия функции serve(customer:) ниже выполняет ту же самую операцию, но вместо использования явного замыкания, она использует автозамыкание, поставив маркировку при помощи атрибута @autoclosure. Теперь вы можете вызывать функцию, как будто бы она принимает аргумент String вместо замыкания. Аргумент автоматически преобразуется в замыкание, потому что тип параметра customerProvider имеет атрибут @autoclosure.
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

// Если вы хотите чтобы автозамыкание могло сбежать, то вам нужно использовать оба атрибута и @autoclosure, и @escaping

// customersInLine равен ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
 
print("Collected \(customerProviders.count) closures.")
// Выведет "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Выведет "Now serving Barry!"
// Выведет "Now serving Daniella!"



//: [Next](@next)
