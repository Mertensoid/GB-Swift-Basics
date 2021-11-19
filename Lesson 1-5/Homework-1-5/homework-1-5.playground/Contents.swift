import UIKit

enum windowsConditions: String {
    case opened = "открыты"
    case closed = "закрыты"
}

enum engineConditions: String {
    case on = "работает"
    case off = "выключен"
}

enum Action {
    case move
    case stop
}

protocol Car {
    var maxSpeed: Double {get set}
    var numberOfWeels: Int {get set}
    var mark: String {get set}
    var windows: windowsConditions {get set}
    var engine: engineConditions {get set}
    
    func action(action: Action) -> ()
}

extension Car {
    func move(speed: Double) -> () {
        print("Едем со скоростью \(speed)")
    }
}

extension Car {
    mutating func switchEngine() -> () {
        if self.engine == .off {
            self.engine = .on
        } else {
            self.engine = .off
        }
    }
}

extension Car {
    mutating func switchWindows() -> () {
        if self.windows == .closed {
            self.windows = .opened
        } else {
            self.windows = .closed
        }
    }
}

class TrunkCar: Car {
    func action(action: Action) {
        switch action {
        case .move:
            print("Move")
        default:
            print("Stop")
        }
    }
    
    var maxSpeed: Double
    var numberOfWeels: Int
    var mark: String
    var windows: windowsConditions = .closed
    var engine: engineConditions = .off
    
    init(mark: String, numberOfWeels: Int, maxSpeed: Double, trunkType: TrunkType, trunkSize: Double) {
        self.mark = mark
        self.numberOfWeels = numberOfWeels
        self.maxSpeed = maxSpeed
        self.trunkType = trunkType
        self.trunkSize = trunkSize
    }
    
    var trunkSize: Double
    var trunkType: TrunkType
    
}

enum TrunkType: String {
    case tank = "цистерна"
    case trailer = "прицеп"
    case refrigerator = "холодильник"
    case cabin = "бытовка"
}

class SportCar: Car {
    func action(action: Action) {
        switch action {
        case .move:
            print("Move")
        default:
            print("Stop")
        }
    }
    
    var maxSpeed: Double
    var numberOfWeels: Int
    var mark: String
    var windows: windowsConditions = .closed
    var engine: engineConditions = .off
    
    init(mark: String, numberOfWeels: Int, maxSpeed: Double, pilot: String) {
        self.mark = mark
        self.numberOfWeels = numberOfWeels
        self.maxSpeed = maxSpeed
        self.pilot = pilot
    }
    
    var prizes: [String] = []
    var pilot: String
    
    func addPrize(prize: String) {
        prizes.append(prize)
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(mark). \(numberOfWeels) колеса. Максимальная скорость \(maxSpeed) км/ч. За рулем - \(pilot). Окна - \(windows.rawValue), мотор \(engine.rawValue)"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\(mark). \(numberOfWeels) колес. Максимальная скорость \(maxSpeed) км/ч. Тип кузова - \(trunkType.rawValue) объемом \(trunkSize) м3. Окна - \(windows.rawValue), мотор \(engine.rawValue)"
    }
}

var subaru = SportCar(mark: "Subaru Impreza WRX STI", numberOfWeels: 4, maxSpeed: 280.0, pilot: "Ken Block")
subaru.addPrize(prize: "100 Acre Wood #1")
subaru.addPrize(prize: "Rally America 2008 #2")
subaru.switchEngine()
subaru.switchWindows()
print(subaru)

var kamaz = TrunkCar(mark: "Камаз", numberOfWeels: 6, maxSpeed: 120, trunkType: .refrigerator, trunkSize: 10)
print(kamaz)
