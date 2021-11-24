import Darwin

var isInControl = true

func selfDrive() {
    if isInControl {
        print("good")
    } else {
        print("bad")
    }
}



var lostGPS = true
var lowBattery = true

func autoDriveTesla() {
    if lowBattery {
        print("low battery")
    }
    if lostGPS {
        print("we lost")
    }
}

// Erroe handling - рекомендация Apple
// Список ошибок
enum TeslaError : Error {
    case lostGPS
    case lowBattery
}

//Отлов ошибок
func autoDriveTeslaError() throws {
    if lostGPS {
        throw TeslaError.lostGPS
    }
    if lowBattery {
        throw TeslaError.lowBattery
    }
}

//Обработка ошибок
do {
    try autoDriveTeslaError()
} catch TeslaError.lostGPS {
    print("we lost")
} catch TeslaError.lowBattery {
    print("low battery")
}

enum jsonDownload: Error {
    case moreSizeFileDownload
    case serverError(error: Int)
    case noNameFiles
}

struct File {
    var image: String
    var size: Int
}

class downloadJSON {
    var fileDownload = [
        "dog.jpeg" : File(image: "dog", size: 12),
        "cat.jpeg" : File(image: "cat", size: 4),
        "car.jpeg" : File(image: "car", size: 8)
    ]
    
    var sizeDownload = 10
    var errorValue = 200
    
    func downloadItem(itemNamed name: String, error: Int) throws {
        guard let file = fileDownload[name] else {
            throw jsonDownload.noNameFiles
        }
        
        guard file.size < sizeDownload else {
            throw jsonDownload.moreSizeFileDownload
        }
        
        guard errorValue == 200 else {
            throw jsonDownload.serverError(error: errorValue)
        }
        
        print("downloaded \(file.image) sized \(file.size)")
    }
}

let UICollection = [
    "TableView": "dog.jpeg",
    "TabBar": "car.jpeg",
    "CollectionView" : "cat.jpeg"
]

func download(collection: String, funcDownload: downloadJSON) throws {
    let serverMessage = 200
    let collection = UICollection[collection] ?? "LoadScreen"
    try funcDownload.downloadItem(itemNamed: collection, error: serverMessage)
}

do {
    try download(collection: "TableView", funcDownload: downloadJSON())
} catch jsonDownload.noNameFiles {
    print("no file")
} catch jsonDownload.moreSizeFileDownload {
    print("too big")
} catch jsonDownload.serverError(error: 200) {
    print("error 200")
}

//try?

func someThrowFunction() throws -> Int {
    return 10
}

var y: Int?

do {
    y = try someThrowFunction()
} catch {
    y = nil
}

let x = try? someThrowFunction()

enum PasswordError: Error {
    case obvinous
}

func checkPassword(_ password: String) throws -> Bool {
    if password != "password" {
        throw PasswordError.obvinous
    }
    return true
}

do {
    try checkPassword("password")
    print("ok")
} catch {
    print("not good")
}

if let result = try? checkPassword("password") {
    print("Result \(result)")
} else {
    print("Error password")
}

// try!

//let photo = try! checkPassword("/Resource/picture.jpeg")

var array: [String] = ["🔥", "💧", "❄️", "⚡️", "☀️"]

print(array.map {_ in "🍿"})
print(array.filter {i in i == "🔥"})
print(array.contains {i in i == "💧"})
array.reverse()
print(array)

print(array.prefix(2))
print(array.suffix(2))

array.swapAt(0, 2)
print(array)

print(array.dropFirst(2))
print(array.dropLast(2))

array.removeAll() {i in i == "❄️"}
print(array)

