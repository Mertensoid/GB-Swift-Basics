import Darwin

enum RoboVacuumCleanerErrors : Error {
    case lowBattery
    case emptyWaterTank
    case noConnection
    case wrongTarget
}

struct Room {
    var roomName: String
    var needWater: Int
    var needEnergy: Int
}

class RoboVacuumCleaner {
    
    var waterLevel: Int
    var batteryLevel: Int
    var connection: Bool
    var rooms = [
        "Bedroom" : Room(roomName: "Bedroom", needWater: 10, needEnergy: 8),
        "Living room" : Room(roomName: "Living room", needWater: 23, needEnergy: 32),
        "Children's room" : Room(roomName: "Children's room", needWater: 15, needEnergy: 12)
    ]
    
    init(water: Int, battery: Int, connection: Bool) {
        self.waterLevel = water
        self.batteryLevel = battery
        self.connection = connection
    }
    
    func clean(room: String) -> String {

        guard connection else {
            return "Произошла ошибка: \(RoboVacuumCleanerErrors.noConnection)"
        }
        guard let _ = rooms[room] else {
            return "Произошла ошибка: \(RoboVacuumCleanerErrors.wrongTarget)"
        }
        guard rooms[room]!.needEnergy <= batteryLevel else {
            return "Произошла ошибка: \(RoboVacuumCleanerErrors.lowBattery)"
        }
        guard rooms[room]!.needWater <= waterLevel else {
            return "Произошла ошибка: \(RoboVacuumCleanerErrors.emptyWaterTank)"
        }
        waterLevel -= rooms[room]!.needWater
        batteryLevel -= rooms[room]!.needEnergy
        return "Уборка в комнате \(rooms[room]!.roomName) началась!"
    }
}

let cleaner1 = RoboVacuumCleaner(water: 80, battery: 10, connection: true)

print(cleaner1.clean(room: "Bedroom"))
print(cleaner1.clean(room: "Living room"))

enum SlotMachineErrors : Error {
    case noPower
    case wrongGame
    case needMaintenance
    case notEnoughMoney(money: Int)
    case serviceModeOn
}

struct Game {
    var name: String
    var cost: Int
}

class SlotMachine {
    var power: Bool
    private var serviceMode = false
    var maxMoney: Int = 10000
    var minMoney: Int = 1000
    var currentMoney: Int = 5000
    var playersMoney: Int = 0
    
    var games = [
        "Book of Ra" : Game(name: "Book of Ra", cost: 100),
        "Crazy Monkey" : Game(name: "Crazy Monkey", cost: 10),
        "Fruit Coctail" : Game(name: "Fruit Coctail", cost: 50),
        "Golden Mine" : Game(name: "Golden Mine", cost: 25)
    ]
    
    init(power: Bool) {
        self.power = power
    }
    
    func serviceModeSwitch() throws {
        guard power == true else {
            throw SlotMachineErrors.noPower
        }
        if serviceMode {
            serviceMode = false
        } else {
            serviceMode = true
        }
    }
    
    func moneyInput(money: Int) throws {
        guard power == true else {
            throw SlotMachineErrors.noPower
        }
        guard serviceMode == false else {
            throw SlotMachineErrors.serviceModeOn
        }
        guard currentMoney + money < maxMoney && currentMoney > minMoney else {
            throw SlotMachineErrors.needMaintenance
        }
        playersMoney += money
    }
    
    func play(game: String) throws -> Int {
        guard power == true else {
            throw SlotMachineErrors.noPower
        }
        guard serviceMode == false else {
            throw SlotMachineErrors.serviceModeOn
        }
        guard let _ = games[game] else {
            throw SlotMachineErrors.wrongGame
        }
        guard playersMoney >= games[game]!.cost else {
            throw SlotMachineErrors.notEnoughMoney(money: games[game]!.cost - playersMoney)
        }
        let winCondition = Int.random(in: 1...100)
        var prize: Int = 0
        if winCondition > 70 {
            prize = games[game]!.cost * Int.random(in: 1...10)
        } else {
            prize = 0
        }
        return prize
    }
}

var slotMachine = SlotMachine(power: true)

do {
    try slotMachine.moneyInput(money: 5)
} catch SlotMachineErrors.noPower {
    print("Игровой автомат выключен")
} catch SlotMachineErrors.serviceModeOn {
    print("Включен сервисный режим. Обратитесь к администратору")
} catch SlotMachineErrors.needMaintenance {
    print("Требуется обслуживание обратитесь к администратору")
}

do {
    try print("Ваш выигрыш - " + String(slotMachine.play(game: "Some Game")))
} catch SlotMachineErrors.noPower {
    print("Игровой автомат выключен")
} catch SlotMachineErrors.serviceModeOn {
    print("Включен сервисный режим. Обратитесь к администратору")
} catch SlotMachineErrors.wrongGame {
    print("Вы выбрали не существующую игру")
} catch SlotMachineErrors.notEnoughMoney(let moneyNeeded) {
    print("Недостаточно денег. Внесите еще \(moneyNeeded)")
}

do {
    try print("Ваш выигрыш - " + String(slotMachine.play(game: "Crazy Monkey")))
} catch SlotMachineErrors.noPower {
    print("Игровой автомат выключен")
} catch SlotMachineErrors.serviceModeOn {
    print("Включен сервисный режим. Обратитесь к администратору")
} catch SlotMachineErrors.wrongGame {
    print("Вы выбрали не существующую игру")
} catch SlotMachineErrors.notEnoughMoney(let moneyNeeded) {
    print("Недостаточно денег. Внесите еще \(moneyNeeded)")
}


