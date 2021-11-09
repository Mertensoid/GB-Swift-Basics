import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var russianCurrency: String = "Rouble"

var dollarCur: String = "dollar"
var euro: String = "euro"

var currency: [String] = ["Rouble", "dollar", "euro"]

enum currency_enum {
    case Rouble
    case Dollar
    case Euro
}

var rouble: currency_enum = .Rouble
var dollar = currency_enum.Dollar

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn(turn: Direction)
    
    enum Direction: String {
        case Left = "Left"
        case Right = "Right"
    }
//    enum action2 {
//        case fly
//        case jump
//    }
}

var action = Action.Run(meters: 150, speed: 12)
action = .Stop
action = .Walk(meters: 100)

//var Action2 = Action.action2.fly
//Action2 = .jump

switch action {
    case .Stop:
    print("Stop")
case .Walk(let meters) where meters < 100:
    print ("small walk")
case .Walk:
    print("long walk")
case .Run(let meters ,let speed):
    print("\(meters)\(speed)")
case .Turn(let turn) where turn == .Left:
    print("\(turn.rawValue)")
case .Turn(let turn) where turn == .Right:
    print("\(turn.rawValue)")
default:
    break
}

/// СТРУКТУРЫ

struct playerInChess {
    
    //свойства
    var name: String = ""
    var wins: Int = 0
    
    //методы
    func description() {
        print("Игрок \(name) с победами \(wins)")
    }
    
    mutating func addWins(wins: Int) {
        self.wins += wins
    }
    
    //конструктор(инициализатор)
    init(playerName: String, playerWins: Int){
        self.wins = playerWins
        self.name = playerName
    }
    
    init(){
        self.wins = 0
        self.name = ""
    }
}

var maks = playerInChess()
print(maks)

maks.name = "Макс"
maks.wins = 3
maks.addWins(wins: 23)


var oleg = playerInChess(playerName: "Олег", playerWins: 10)
print(oleg)
oleg.addWins(wins: 3)

if maks.wins > oleg.wins {
    print("Макс играет лучше")
} else {
    print("Олег играет лучше")
}

let urlBitcoin = "https://www.cryptingup.com/api/markets"
let urlBit = URL(string: urlBitcoin)!

URLSession.shared.dataTask(with: urlBit) {(data, responce, error) in
    if let data = data {
        let jsonString = String(data: data, encoding: .utf8)
        print(jsonString)
    } else {
        print(error)
    }
}.resume()

struct Bitcoin: Decodable {
    let markets: [Markets]
}

struct Markets: Decodable {
    let symbol: String
    let price: Double
    let change_24h: Double
}
