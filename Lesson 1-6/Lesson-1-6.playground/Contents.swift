import UIKit

// ДЖЕНЕРИКИ

func swapTwoInt(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}


var someInt = 3
var anotherInt = 10

swapTwoInt(&someInt, &anotherInt)

print(someInt)
print(anotherInt)


func swapTwoString(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

swapTwoValues(&someInt, &anotherInt)

print(someInt)
print(anotherInt)

var h = "Hell"
var w = "World"

swapTwoValues(&h, &w)
print(h)
print(w)

struct InStack {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()
stackOfString.push("one")
stackOfString.push("two")

print(stackOfString.items)

var stackOfInt = Stack<Int>()


//class SomeClass {
//
//}
//
//protocol SomeProtocol {
//
//}
//
//func someFunc<T: SomeClass, U: SomeProtocol>(some: T, someU: U) {
//
//}

func findIndexString(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let stringArray = ["cat", "dog", "hippo"]
if let foundIndex = findIndexString(ofString: "cat", in: stringArray) {
    print("Index: \(foundIndex)")
}


func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let intArray = [1,2,3,4,5,6,7,8]
var findArray = findIndex(ofString: 4, in: intArray)
print(findArray)

struct test: Equatable {
    var a: Int
    var b: Int
    
    static func == (lhs: test, rhs: test) -> Bool {
        return lhs.a == rhs.a
    }
}

var aTest = test(a: 10, b: 543)
var bTest = test(a: 10, b: 123)

if aTest == bTest {
    print("=")
} else {
    print("!=")
}

class Gree {
    static let english = "Hello"
}
print(Gree.english)



//subscripting

let arrrray = [1,2,3,4,5]

arrrray[0]


//subscript(index: Int) -> Int {
//    get{
//
//    }
//    set{
//
//    }
//}

struct TimesTable {
    let multi: Int
    
    subscript(index:Int) -> Int {
        return multi * index
    }
}

let threeTimesTable = TimesTable(multi: 3)
print("* \(threeTimesTable[6])")


struct Welcome {
    var a = "Hello"
    var b = "Hi"
    var c = "Privet"
    
    subscript(index:Int) -> String {
        get {
            switch index {
            case 0: return a
            case 1: return b
            case 2: return c
            default:
                return ""
            }
        }
        set {
            switch index {
            case 0: a = newValue
            case 1: b = newValue
            case 2: c = newValue
            default:
                break
            }
        }
    }
    subscript(index:Int, word: String) -> String {
        var text = self[index]
        text += " " + word
        return text
    }
    
}

var wel = Welcome()

print(wel[0])

wel[1] = "Hello GB"

print(wel[1])

print(wel[0, "world"])

//ЗАМЫКАНИЯ

let valueArray = [3,5,8,123,627,167,1]

func filterA(array: [Int], function: (Int)->Bool) -> [Int] {
    var newFilterArray = [Int]()
    
    for i in array {
        if function(i) {
            newFilterArray.append(i)
        }
    }
    return newFilterArray
}

func compare(i: Int) -> Bool {
    return i % 2 == 0
}

func bifFive(o: Int) -> Bool {
    return o > 5
}
print(filterA(array: valueArray, function: compare))
print(filterA(array: valueArray, function: bifFive))

print(filterA(array: valueArray, function: {(i: Int) -> Bool in
    return i % 2 == 0
    }))

let names = ["Николай", "Максим", "Никита", "Карим", "Егор"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reverseNamed = names.sorted(by: backward)
print(reverseNamed)

reverseNamed = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 < s2
})

print(reverseNamed)

reverseNamed = names.sorted(by: {s1,s2 in return s1 < s2})
print(reverseNamed)

reverseNamed = names.sorted(by: {$0 > $1})
print(reverseNamed)

var arrayMap = [1,2,3,4,5,6,67,87]

var newArray = arrayMap.map { $0 * 2 }
print(newArray)

//map
//sorted
//filter
//и т.д.
//функции высшего порядка

var newNewArray = arrrray.map {$0 % 2}.filter {$0 == 1}
print(newNewArray)


let numbers = ["42", "1", "Not"]
let ints = numbers.compactMap{Int($0)}
print(ints)

let string = ["Николай", "Максим", "Никита", "Карим", "Егор"]

let uUuercased = string.map {$0.lowercased()}

let digitNames = [
    0: "Zero",  1:"One", 2: "Two"
]

let numbersMap = [102,21,12]

let stringMap = numbersMap.map {(number) -> String in
    var numbers = number
    var outPut = ""
    
    repeat {
        outPut = digitNames[numbers % 10]! + outPut
        numbers /= 10
    } while numbers > 0
    return outPut
}

print(stringMap)
