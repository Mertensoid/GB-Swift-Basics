import Foundation
//import UIKit
import PlaygroundSupport


//инкапсуляция

class People {
    private(set) var name = "Petr"
    
    func printHI() {
        print("HI \(name)")
    }
}

var p = People()
//print(p.name)
//
//p.name = "Max"
//print(p.name)

//полиморфизм

var a = 5
var b = 10
var c = a + b

var aa = "Hello"
var bb = "GB"
var cc = aa + bb

struct Resolution {
    var w = 0
}

let hd = Resolution(w: 1080)
var cinema = hd
cinema.w = 2048

print(hd.w)
print(cinema.w)

class VideoMode {
    var f = 0
}

let ten = VideoMode()
ten.f = 1080
let alsoTen = ten
alsoTen.f = 2048

print(ten.f)
print(alsoTen.f)

enum chessmenType {
    case king, castle, queen
}

enum chessmenColor {
    case white, black
}

class Chessman {
    let type: chessmenType
    let color: chessmenColor
    var coordinate: (String, Int)? = nil
    
    init(type: chessmenType, color: chessmenColor) {
        self.type = type
        self.color = color
    }
    
    func setCoordinate(char c: String, num n: Int) {
        self.coordinate = (c, n)
    }

    func kill() {
        self.coordinate = nil
    }
    
    init(type: chessmenType, color: chessmenColor, coordinate: (char: String, num: Int)) {
        self.type = type
        self.color = color
        self.setCoordinate(char: coordinate.char, num: coordinate.num)
    }
}



var king = Chessman(type: .king, color: .white)
king.setCoordinate(char: "A", num: 2)
king.kill()

var queen = Chessman(type: .queen, color: .black, coordinate: ("A", 3))

class SubChessman: Chessman {
    func printChessmanType() {
        print(self.type)
    }
    
    override func setCoordinate(char c: String, num n: Int) {
        self.coordinate = (c, n * 2)
        print(self.coordinate)
    }
}

var castle = SubChessman(type: .castle, color: .white)
castle.setCoordinate(char: "B", num: 3)
castle.printChessmanType()

//var view = UIView()
//view.backgroungColor = .blue
//
//var label = UILabel()
//label.text = "Hello world"
//label.frame = CGRect(x: 150, y:200, width: 150, height: 150)
//label.textColor = .black
//label.backgroundColor = .green
//
//view.addSubview(label)
//
//PlaygroundPage.current.liveView = view

class SuperClass {
    init?(isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("Done")
        }
    }
    
    deinit {
        print("deinit")
    }
}

class SubClass: SuperClass {
    deinit {
        print("SubClass deinit")
    }
}


var obj = SubClass(isNil: false)
obj = nil

class Person {
    let name: String
    
    init(name: String){
        self.name = name
        print("\(name) init")
    }
    
    deinit {
        print("\(name) deinit")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "Карим")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

class Human {
    var name: String
    var child = [Human]()
    weak var father: Human?
    weak var mother: Human?
    
    init(name: String) {
        self.name = name
        print("\(name) init")
    }
    
    deinit {
        print(self.name + "kill")
    }
}

if 1 == 1 {
    let kirriil = Human(name: "Кирилл")
    let olga = Human(name: "olga")
    let Alex = Human(name: "Alex")
    
    kirriil.father = Alex
    kirriil.mother = olga
    
    Alex.child.append(kirriil)
    olga.child.append(kirriil)
}

