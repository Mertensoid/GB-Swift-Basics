import UIKit
import Darwin

enum winCondition: String {
    case opened = "открыты"
    case closed = "закрыты"
}

enum engineCondition: String {
    case on = "включен"
    case off = "выключен"
}

enum competition {
    case streetRacing
    case rally
    case circleRacing
    case drift
    case enduranceChallenge
}

enum permWeight: Int {
    case biaxial = 18
    case three_axis = 25
    case four_axis = 32
    case five_axis = 35
}

enum material: String{
    case sand = "песок"
    case crushed_stone = "щебень"
    case bricks = "кирпичи"
    case wood = "древесина"
}

enum carAction{
    case engineSwitch(turn: engineCondition)
    case windowsSwitch(turn: winCondition)
    case upload(value: Double)
    case unload(value: Double)
    case participate(inCompetition: competition)
    case bring(material: material)
}

class Car {
    var mark: String
    var year: Int
    var trunkVolume: Double
    var trunkFill: Double
    var windows: winCondition
    var engine: engineCondition
    
    func action(action: carAction) -> () {
        
    }
    
    init(mark: String, year: Int, trunkVolume: Double){
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.trunkFill = 0
        self.windows = .closed
        self.engine = .off
    }
}

class TrunkCar: Car {
    var permittedWeight: permWeight
    
    init(mark: String, year: Int, trunkVolume: Double, permitted: permWeight) {
        self.permittedWeight = permitted
        super.init(mark: mark, year: year, trunkVolume: trunkVolume)
    }
    
    override func action(action: carAction) {
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
            print("Кузов маловат!")
        case .upload(let value) where self.trunkVolume - self.trunkFill >= value:
            print("Загружено \(value) м3")
            self.trunkFill += value
        case .unload(let value) where self.trunkFill < value:
            print("В кузове нет столько груза")
        case .unload(let value) where self.trunkFill >= value:
            print("Выгружено \(value) м3")
            self.trunkFill -= value
        case .bring(material: .sand):
            print("Ожидайте доставку песка завтра с 10:00 до 19:00")
        case .bring(material: .bricks):
            print("Ожидайте доставку кирпичей завтра с 10:00 до 19:00")
        case .bring(material: .crushed_stone):
            print("Ожидайте доставку щебня завтра с 10:00 до 19:00")
        case .bring(material: .wood):
            print("Ожидайте доставку древесины завтра с 10:00 до 19:00")
        default:
            print("Ваш автомобиль не подходит для этого!")
            break
        }
    }
    
    func printData() -> (){
        print("Грузовик марки \(self.mark) выпущен в \(self.year) и имеет кузов объемом \(self.trunkVolume) м3. Сейчас в кузов загружено \(self.trunkFill) м3, окна \(self.windows.rawValue), двигатель \(self.engine.rawValue). Максимальная разрешенная масса - \(self.permittedWeight.rawValue) тонн.")
    }
}

class SportCar: Car {
    var maxSpeed: Double
    
    init(mark: String, year: Int, trunkVolume: Double, max: Double) {
        self.maxSpeed = max
        super.init(mark: mark, year: year, trunkVolume: trunkVolume)
    }
    
    override func action(action: carAction) -> (){
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
        case .participate(inCompetition: .drift):
            print("Приезжайте на трассу!")
        case .participate(inCompetition: .circleRacing):
            print("Заявка на соревнования по кольцевым гонкам отправлена")
        case .participate(inCompetition: .enduranceChallenge):
            print("Следующий этап REC летом 2022!")
        case .participate(inCompetition: .rally):
            print("Заявка на участие в ралли отправлена")
        case .participate(inCompetition: .streetRacing):
            print("Завтра в 4:00. 73 км МКАД!")
        default:
            print("Ваш автомобиль не подходит для этого!")
            break
        }
    }
    
    func printData() -> (){
        print("Спорткар марки \(self.mark) выпущен в \(self.year) и имеет багажник объемом \(self.trunkVolume) м3. Сейчас в багажник загружено \(self.trunkFill) м3, окна \(self.windows.rawValue), двигатель \(self.engine.rawValue). Максимальная скорость - \(self.maxSpeed) км/ч")
    }
}

var honda = SportCar(mark: "Honda", year: 2017, trunkVolume: 0.5, max: 280)
honda.action(action: .windowsSwitch(turn: .opened))
honda.action(action: .engineSwitch(turn: .on))
honda.action(action: .participate(inCompetition: .streetRacing))
honda.action(action: .bring(material: .bricks))

var zil = TrunkCar(mark: "ZIL", year: 1980, trunkVolume: 25, permitted: .three_axis)
zil.action(action: .bring(material: .sand))
zil.action(action: .engineSwitch(turn: .on))
zil.action(action: .upload(value: 27))
zil.action(action: .upload(value: 20))
zil.action(action: .unload(value: 20))
zil.action(action: .participate(inCompetition: .drift))

honda.printData()
zil.printData()
