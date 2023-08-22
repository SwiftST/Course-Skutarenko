//: [Previous](@previous)

import Foundation

// MARK: String
// String в Swift имеет быструю и современную реализацию. Каждая строка состоит из независимых от кодировки символов Unicode, и обеспечивает поддержку доступа к этим символам в различных Unicode представлениях
// Тип String в Swift бесшовно сшит с классом NSString из фреймворка Foundation.

// MARK: Строковые литералы
 // Строковые литералы - это фиксированная последовательность символов, окруженная парой двойных ковычек
let someString = "Some string literal value"

// MARK: Многострочные литералы строк
// Если необходимо создать строку поддерживающую многострочный вид, используйте литерал многострочной строки - последовательность символов окруженная тремя двойными ковычками
let quotation = """
The White Rabbit put on his spectacles. "Where shall I begin,
please your Majesty? he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
//print(quotation)

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

// если есть необходимость сделать код более читабельным, но вы не хотите чтобы символ переноса строки отображался в качестве части значения строки, то нужно использовать символ обратного слеша (\) в конце этих строк:
let softWrappedQuotation = """
The White Rabbit put on his spectacles. "Where shall I begin, \
please your Majesty? he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
//print(softWrappedQuotation)
// Для того чтобы слздать литерал строки, котрый начинается и заканчивается символом возврата каретки (\r), напишите пустую строчку в самом начале и в конце литерала строки:
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

// Многострочная строка может иметь отсупы для соответствия окружающему ее коду. Пробел до закрывающей группы двойных кавычек (""") сообщает Swift, сколько пробелов нужно игнорировать в начале каждой строки. Если же написать дополнительные пробелы напротив какой либо строкик тем, которые стоят напротив закрывающих кавычек, то эти дополнительные пробелы уже будут включены в значение строки:
let lineWithIdentation = """
    Эта строка начинается без пробелов в начале.
        Эта строка имеет 4 пробела.
    Эта строка так же начинается без пробелов
    """
print(lineWithIdentation)

// MARK: Специальные символы в строковых литералах
// Строковые литералы могут включать в себя следующие спеиальные символы:
// Экранированные специальные символы:
// \0 - нулевой символ
// \\  - обратный слэш
// \t  - горизонтальная табуляция
// \n  - новая строка
// \r  - возвращение каретки
// \"  - двойные кавычки
// \'  - одиночные кавычки

// Произвольные скалярные величины Юникода, записанные в виде \u{n}, где n - 1-8 значное шестнадцатеричное число со значением, равным действительной точке кода Юникода

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)
let example = "\tdsvsv\rWhat is it?\r\'regeg\'"
print(example)
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparkLineHeart = "\u{1F496}"

// Для того чтобы включить символы """ в многострочную строку, нужно экранировать хотя бы одну кавычку
let threeDoubleQoutes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print(threeDoubleQoutes)

// MARK: Расширенные разделители строк
// Вы можете поместить строковый литерал внутрь расширенного разделителя, чтобы включить в строку специальные символы, не вызывая эффекта самих этих символов.
var someStringOne = #"Line1\nLine2"#
print(someStringOne)
// Если нужен эффект специального символа, то нужно сопоставить количество знаков (#) в строке после символа экранирования (\)
someStringOne = #"Line1\#nLine2"#
print(someStringOne)
print(###"One\###nTwo"###)

// Cтроковые литералы, созданные с использованием расширенных раазделителей, так же могут быть многострочными строковыми литералами.
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)

// MARK: Инициализация пустых строк
// c помощью присвоения пустового строкового литерала
var emptyString = ""
// с помощью синтаксиса инициализации
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

// MARK: Работа с символами
// Итерация по символам строки
for char in "Dog!" {
    print(char)
}

let exclamationMark: Character = "!"

// Значения типа String могут быть созданы путем передачи массива типа [Character] в инициализатор:
let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

// MARK: Конкатенация строк и символов

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

// Можно добавить Character к переменной String с помощью метода String append:
welcome.append(exclamationMark)

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)

// MARK: Интерполяция строк
// Интерполяция строк - способ создать новое значение типа String из разных, констант, переменных, литералов и выражений, включая их значения в строковый литерал.

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Выражения, записываемые внутри скобок в интерполируемой строке, не должны содержать неэкранированный обратный слэш, символ переноса строки (\n) или символ возврата каретки (\r)

// MARK: Unicode (юникод)
// Юникод является международным стандартом для кодирования, представления и обработки текста в разных системах письма. Он позволяет представить почти любой символ из любого языка в стандартизированную форму. А так же читать и записывать эти символы во внешний источник (веб страница, текстовый файл) и из него. Типы String and Character совместимы с Unicode

// MARK: Скалярные величины Юникода
// String в Swift построен из скалярных значений (Unicode scalar) Юникода. Скалярная величина Юникода является уникальным 21-рязрядным числом для символа или модификатора, например U+0061 для Latin Small Letter A ("a").

// Скалярная величина Юникода - это любая точка кода в диапазоне U+0000 до U+D7FF включительно, или U+E000 до U+10FFFF тоже включительно. Скалярные величины Юникода не включают Юникод суррогатные пары точек кода, т.е. точки кода в диапазоне U+D800 до U+DFFF включительно

// Не все скалярные величины юникода присваиваются символу. Некоторые скалярные величины содержатся в резерве для будующего присваивания

// MARK: Расширяемые наборы графем
// Каждый экземпляр типа Character в Swift представляет один расширенный набор графем. Расширенный набор графем является последовательностью одного и более скалярных величин Юникода, которые (будучи объединенными) производят один читаемый символ.
// Например буква é может быть представлена в виде cамостоятельной скалярной величины Юникода é(LATIN SMALL LETTER E WITH ACUTE, или U+0065). Тем не менее, та же буква может быть представлена в виде пары скалярных величин - стандартной буквой е(LATIN SMALL LETTER E, или U+0065) и последующей скалярной величиной COMBINING ACUTE ACCENT (U+0301). COMBINING ACUTE ACCENT графически присоединяется к предшествующей скалярной величине, превращая е в é, в момент, когда распознающая Юникод символы система, начинает рендер.

// В обоих случаях буква é представляется в виде одного Character значения, которое представляет собой расширенный набор графем

let eAcute: Character = "\u{E9}"
let combinatedEAcute: Character = "\u{65}\u{301}"

// Расширенный набор графем - это удобный способ представления многих сложных печатных символов, как одного значения Character.

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
precomposed == decomposed

// Расширенный набор графем позволяет скалярам заключающих символов (например, COMBINING ENCLOSING CIRCLE, или U+20DD), заключать другие скаляры Юникода и выглядеть как значение типа Character

let enclosedEAcute = "\u{E9}\u{20DD}"

// Скалярные величины Юникода для региональных символов могут быть объеденены в пары для создания одного Character значения, таких как эта комбинация: REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA) и REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8)

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// MARK: Подсчет символов

let unusualMenagerie = "Коала, Улитка, Пингвин, Верблюд "
print("unusualMenagerie contains \(unusualMenagerie.count) symbols")

// Использование расширенных наборов графем для Character означает что модификация или конкатенация не всегда могут повлиять на количество символов в строке

var word = "cafe"
word.count
word += "\u{301}"
word.count
word += "\u{20DD}"
word.count
(word as NSString).length
for (index, letter) in word.enumerated() {
    print("\(index + 1) \(letter)")
}

// Расширенный набор графем может состоять из одного или более скалярных величин Юникода. Это означает, что различные символы, и различное отображение одного и того же символа, могут потребовать разных объемов памяти для хранения. Из-за этого символы в Swift не занимают одинаковый объем памяти в строке. В результате этого, количество символов в строке не может быть подсчитано без итерации в строке, для определения границ расширенного набора графем.
// Свойство length у NSString, основывается на числе 16-битовых блоков кода в UTF-16 представлении строки, а не количестве расширенного набора графем внутри строки.

// MARK: Индексы строки

// Каждое String значение имеет связанный тип индекса: String.index, что соответствует позиции каждого Character в строке.
// Так как различные символы могут занимать разные объемы памяти для хранения, необходимо итерировать каждую скалярную величину Юникода, от начала или конца этой строки. По этой причине строки в Swift не могут быть проиндексированы целочисленными значениями

// startIndex - доступ к позиции первого Character в строке
// endIndex - это позиция после последнего символа строки. Не является допустимым значением
// если Srting пустая, то startIndex и endIndex равны

// index(before:) - доступ у индексу до указанного индекса
// index(after:) - доступ к индексу после указанного индекса

// index(_:offsetBy:) - доступ к индексу

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 8)
greeting[index]

// indeces - свойство для создания Range всех индексов, используемых для доступа к отдельным символам строки

for index in greeting.indices {
    print(greeting[index], terminator: " ")
}
print("")

let rangeIndices = greeting.indices

// Можно использовать свойства startIndex, endIndex и методы index(before:), index(after:) и index(_:offsetBy:) c любым типом, который соответствует протоколу Collection. (Array, Dictionary, Set)


// MARK: Добавление и удаление

// insert(_:at:) - вставить символ по указанному индексу
// insert(contentsOf:at:) - вставить содержимое другой строки (строкового литерала) по указанному индексу

var welcomeOne = "hello"
welcomeOne.insert("!", at: welcomeOne.endIndex)
welcomeOne.insert(contentsOf: " there", at: welcomeOne.index(before: welcomeOne.endIndex))

// remove(at:) - удаление символа строки по указанному индексу
// removeSubrange(_:) - удаление значения по указанному диапазону индексов

welcomeOne.remove(at: welcomeOne.index(before: welcome.endIndex))
welcomeOne
let range = welcomeOne.index(welcomeOne.endIndex, offsetBy: -6)..<welcomeOne.endIndex
welcomeOne.removeSubrange(range)
welcomeOne

// Можно использовать методы insert(at:), insert(contentsOf:at:), remove(at:), removeSubrange(_:) с любыми типами которые соответствуют протоколу RangeReplaceableCollection. (String, Array, Set, Dictionary)

// MARK: Подстроки
// Можно получить подстроку из строки, например, используя сабскрипт или метод типа и prefix(_:), результат которог возвращает экземпляр подстроки, а не другую строку. Подстроки в Swift имеют практически те же самые методы, что и строки, что означает, что можно работать с подстроками так же как и со строками. Однако в отличии от строк, подстроки используются на непродолжительное время, пока проводите манипуляции со строками. Для хранения результата на более продолжительное время, вы конвертируете подстроку в строку:

// firstIndex(of:) - метод возвращающий опциональный индекс первого указываемого символа в строке

let greetingOne = "Hello, world!"
let indexOne = greetingOne.firstIndex(of: ",") ?? greetingOne.endIndex
var begining = greetingOne[..<indexOne]
print(type(of: begining))
// конвертация подстроки в строку для более длительного хранения
let newString = String(begining)

// Как и строки, каждая подстрока имеет область в памяти, где хранятся символы, создающие эту подстроку. Разница между строками и подстроками в том, что для оптимизации производительности подстрока может использовать часть памяти, используемую для хранения исходной стрки или часть памяти, которая используется для хранения другой подстроки. (Строки имеют схожую оптимизацию, но если они делят между собой память, то они считаются равными). Это оптимизация означает, что у вас не будет потери производительности через копирование памяти, если вы не изменяете строку или подстроку.
// Подстроки не подходят для долгосрочного хранения, так как они повторно используют хранилище исходной строки.
// Исходная строка должна находится в памяти до тех пор, пока одна из ее подстрок все еще используется

// String и Substring реализуют протокол StringProtocol

// MARK: Сравнение строк
// Swift предусматривает три способа сравнения текстовых значений: равенство строк, равенство префиксов, равенство суффиксов

// MARK: Равенство строк и символов
// Равенство строк и символов проверяется оператором "равенства" (==) и оператором неравенства (!=)

let quotationOne = "Мы с тобою похожи"
let someQoutation = "Мы с тобою похожи"
if quotationOne == someQoutation {
    print("These lines are equals")
}

// Два String значения (или два Character значения) считаются равными, если их расширенные наборы графем канонически эквивалентны. Расширенные надоры графим канонически эквивалентны, если они имеют один и тот же языковой смысл и внешний вид, даже если они изначально состоят из разных скалярных величин Юникода.

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQustion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQustion {
    print("These lines are equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These lines are not equal")
}

// Сравнение строк и символов не зависит от локализации

// MARK: Равенство префиксов и суффиксов

// hasPrefix(_:), hasSuffix(_:) - методы, которые принимают единственный аргумент типа String и возвращают логическое значение

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

// Подсчет сцен в первом акте с помощью метода hasPrefix(_:)
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("В первом акте - \(act1SceneCount) сцен")

// подсчет сцен где дейтсвие происходит внутри или вокруг особняка Капулетти и клетки монаха Лоренцо
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) сцен в особняке\n\(cellCount) тюремные сцены")

// MARK: Юникод представления строк
// Если строка Юникода записывается в текстовый файл или какое-либо другое хранилище, то скалярные величины Юникода в этой строке кодируются в одном из нескольких Юникод-определенных форм кодирования. Каждая форма кодирует строку мелкими кусками, известными как единица кода.
// UTF-8 форма кодирования - кодирует строку в 8-битные блоки кода
// UTF-16 форма кодирования - кодирует строку в качестве 16-битных блоков кода
// UTF-32 форма кодирования - кодирует строку в 32-битные единицы кода

// Swift предоставляет несколько способов для доступа к отображению строк Юникода:
// Итерация по строке с помощью for-in, для получения индивидуальных Character значений, как расширенных наборов графем
// Свойство строки utf8 для получения набора UTF-8 единиц кода
// Свойство строки utf16 для получения набора UTF-16 единиц кода
// Свойство unicodeScalar для получения набора 21-битных скалярных значений Юникода, что эквивалентно форме кодирования UTF-32
let dogString = "Dog\u{203C}\u{1F436}"
for char in dogString {
    print(char, terminator: " ")
}
print("")

// MARK: Отображение UTF-8
// Свойство utf8 имеет тип String.UTF8View, который представляет собой набор знаений unsigned 8-bit(UInt8), по одному для каждого байта в представлении UTF-8 строки:

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: " ")
}
print("")

// MARK: Отображение UTF-16
// Свойство utf16 имеет тип String.UTF16View, который представляет собой набор знаений unsigned 16-bit(UInt16), по одному для каждого байта в представлении UTF-16 строки:
for codeUnit in dogString.utf16 {
    print("\(codeUnit)", terminator: " ")
}
print("")

// MARK: Отображение скалярных величин Юникода
// С помощью свойтсва unicodeScalars можно получить доступ к скалярному представлению Unicode значения String. Это свойство имеет тип UnicodeScalarView, который представяет собой коллекцию значений типа UnicodeScalar

// Каждый UnicodeScalar имеет свойтсво value, которое возвращает 21-битное значение скаляра, представленное в пределах UInt32:

for scalar in dogString.unicodeScalars {
    print("\(scalar.value)", terminator: " ")
}
print("")

for scalar in dogString.unicodeScalars {
    print(scalar)
}






//: [Next](@next)
