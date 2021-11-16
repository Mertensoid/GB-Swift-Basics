import UIKit

//protocol SomeProtocol {
//
//}
//
//struct SumeStructure: SomeProtocol, FirstProtocol, AnotherProtocol {
//
//}
//
//class SomeClass: SomeSuperClass, SomeProtocol {
//
//}

protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doesNotBeSettable: Int {get}
}

protocol FullyNamed {
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
    
}

let john = Person(fullName: "Джон")

class Starship: FullyNamed {
    var pre: String?
    var name: String
    
    init(name: String, pre: String? = nil){
        self.name = name
        self.pre = pre
    }
    
    var fullName: String {
        return (pre != nil ? pre! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprice", pre: "USS")
print(ncc1701.fullName)

protocol NamedKnight {
    var nameKnight: String {get set}
}

struct Knight: NamedKnight {
    var name: String
    
    var nameKnight: String {
        get{
             return name
        }
        set{
            name = newValue + " knight of Westeros"
        }
    }
}

var knight = Knight(name: "Walter")
print(knight.nameKnight)

knight.nameKnight = "John Snow"
print(knight.nameKnight)


struct Point: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
    
    let x: Int
    let y: Int
}

let p = Point(x: 10, y: 452)
print(p)


struct Human {
    var name: String
}

struct Animal {
    var name: String
}

func printOut(human: Human) {
    human.name
}

func printOutAnimal(animal: Animal) {
    animal.name
}

protocol Printable {
    var name: String {get}
}

struct HumanP : Printable {
    var name: String
}

struct AnimalP : Printable {
    var name: String
}

func printOutP(object: Printable){
    print(object.name)
}

var a = AnimalP(name: "tiger")
var q = HumanP(name: "not tiger")

printOutP(object: a)
printOutP(object: q)

protocol RandomNumberGen {
    func random() -> Double
}

class LInGenNumber: RandomNumberGen {
    func random() -> Double {
        l = (l * b - c)
        return l
    }
    
    var l = 42.0
    var b = 178123.0
    var c = 1384.0
    
}

var generator = LInGenNumber()
print(generator.random())

protocol Togglabel {
    mutating func toggle()
}

enum OnOffSwitch: Togglabel {

    
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        default:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
print(lightSwitch)

lightSwitch.toggle()
print(lightSwitch)

protocol SSomeProtocol {
    init(somePaarameters: Int)
}

class SomeClasss: SSomeProtocol {
    required init(somePaarameters: Int) {
        
    }
}

extension RandomNumberGen {
    func randomBool() -> Bool {
        return random() > 2187397934
    }
}

print(generator.randomBool())

extension Double {
    var km: Double {return self * 1000.0}
    var m: Double {return self}
    var sm: Double {return self / 100.0}
}

var f = 78.39.km
print(f)

var k = 10000.0.sm
print(k)

//extension SomeClass: SomeProtocol {
//
//}

// ПОЛИМОРФИЗМ

protocol Figure {
    func drawFigure()
}

class Rectangle: Figure {
    func drawFigure() {
        print("Draw Rectangle")
    }
}

class Triangle: Figure {
    func drawFigure() {
        print("Draw Triangle")
    }
}

class Ellipse: Figure {
    func drawFigure() {
        print("Draw ellipse")
    }
}

func draw(_ figure: Figure) {
    figure.drawFigure()
}

draw(Rectangle())
draw(Triangle())
draw(Ellipse())


// КОМПОЗИЦИИ ПРОТОКОЛОВ

protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

struct Person1: Named, Aged {
    var name: String
    var age: Int
}

func wishHB(to celebration: Named & Aged) {
    print("Happy Birthday")
}

let hbP = Person1(name: "Sashka", age: 15)

wishHB(to: hbP)
