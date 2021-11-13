import UIKit

enum winCondition: String {
    case opened = "открыты"
    case closed = "закрыты"
}

enum engineCondition: String {
    case on = "включен"
    case off = "выключен"
}

enum carAction{
    case engineSwitch(turn: engineCondition)
    case windowsSwitch(turn: winCondition)
    case upload(value: Double)
    case unload(value: Double)
}

struct SportCar {
    var mark: String
    var year: Int
    var trunkVolume: Double
    var trunkFill: Double
    var windows: winCondition
    var engine: engineCondition
    
    mutating func action(action: carAction) {
        switch action {
        case .engineSwitch(let turn) where turn == .on:
            if self.engine == .on {
                print("Двигатель уже запущен")
            } else {
                print("Двигатель запущен")
                self.engine = turn
            }
        case .engineSwitch(let turn) where turn == .off:
            if self.engine == .off {
                print("Двигатель уже выключен")
            } else {
                print("Двигатель выключен")
                self.engine = turn
            }
        case .windowsSwitch(let turn) where turn == .opened:
            if self.windows == .opened {
                print("Окна уже открыты")
            } else {
                print("Окна открыты")
                self.windows = turn
            }
        case .windowsSwitch(let turn) where turn == .closed:
            if self.windows == .closed {
                print("Окна уже закрыты")
            } else {
                print("Окна закрыты")
                self.windows = turn
            }
        case .upload(let value) where self.trunkVolume - self.trunkFill < value:
            print("Багажник маловат!")
        case .upload(let value) where self.trunkVolume - self.trunkFill >= value:
            print("Загружено \(value) кг")
            self.trunkFill += value
        case .unload(let value) where self.trunkFill < value:
            print("В багажнике нет столько вещей")
        case .unload(let value) where self.trunkFill >= value:
            print("Выгружено \(value) м3")
            self.trunkFill -= value
        default:
            break
        }
    }
    func printData() -> (){
        print("Спорткар марки \(self.mark) выпущен в \(self.year) и имеет багажник объемом \(self.trunkVolume) м3. Сейчас в багажник загружено \(self.trunkFill) м3, окна \(self.windows.rawValue), двигатель \(self.engine.rawValue).")
    }
}

struct TrunkCar{
    var mark: String
    var year: Int
    var trunkVolume: Double
    var trunkFill: Double
    var windows: winCondition
    var engine: engineCondition
    
    mutating func action(action: carAction) {
        switch action {
        case .engineSwitch(let turn) where turn == .on:
            if self.engine == .on {
                print("Двигатель уже запущен")
            } else {
                print("Двигатель запущен")
                self.engine = turn
            }
        case .engineSwitch(let turn) where turn == .off:
            if self.engine == .off {
                print("Двигатель уже выключен")
            } else {
                print("Двигатель выключен")
                self.engine = turn
            }
        case .windowsSwitch(let turn) where turn == .opened:
            if self.windows == .opened {
                print("Окна уже открыты")
            } else {
                print("Окна открыты")
                self.windows = turn
            }
        case .windowsSwitch(let turn) where turn == .closed:
            if self.windows == .closed {
                print("Окна уже закрыты")
            } else {
                print("Окна закрыты")
                self.windows = turn
            }
        case .upload(let value) where self.trunkVolume - self.trunkFill < value:
            print("Багажник маловат!")
        case .upload(let value) where self.trunkVolume - self.trunkFill >= value:
            print("Загружено \(value) кг")
            self.trunkFill += value
        case .unload(let value) where self.trunkFill < value:
            print("В кузове нет столько груза")
        case .unload(let value) where self.trunkFill >= value:
            print("Выгружено \(value) кг")
            self.trunkFill -= value
        default:
            break
        }
    }
    func printData() -> (){
        print("Грузовик марки \(self.mark) выпущен в \(self.year) и имеет кузов объемом \(self.trunkVolume) м3. Сейчас в кузов загружено \(self.trunkFill) м3, окна \(self.windows.rawValue), двигатель \(self.engine.rawValue).")
    }
}

var mySportCar = SportCar(mark: "Ferrari", year: 2020, trunkVolume: 0.2, trunkFill: 0, windows: .opened, engine: .off)
var friendsSportCar = SportCar(mark: "LADA", year: 1999, trunkVolume: 0.8, trunkFill: 0.4, windows: .closed, engine: .off)

var myTruck = TrunkCar(mark: "ЗИЛ", year: 1956, trunkVolume: 19.8, trunkFill: 16, windows: .opened, engine: .on)
var friendsTruck = TrunkCar(mark: "Peterbilt", year: 2019, trunkVolume: 56.3, trunkFill: 10, windows: .closed, engine: .off)

mySportCar.printData()
friendsSportCar.printData()
myTruck.printData()
friendsTruck.printData()

mySportCar.action(action: .windowsSwitch(turn: .closed))
mySportCar.action(action: .upload(value: 1))
mySportCar.action(action: .upload(value: 0.1))
mySportCar.action(action: .unload(value: 0.05))

friendsTruck.action(action: .engineSwitch(turn: .on))
friendsTruck.action(action: .windowsSwitch(turn: .opened))
friendsTruck.action(action: .upload(value: 42))
friendsTruck.action(action: .unload(value: 100))
friendsTruck.action(action: .unload(value: 33.1))

mySportCar.printData()
friendsTruck.printData()

