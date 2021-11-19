import UIKit

struct Queue<ItemType> {
    private var queueArray: [ItemType] = []
    
    mutating func enqueue(item: ItemType) {
        queueArray.append(item)
    }
    
    mutating func dequeue() -> ItemType? {  // <<< Вопрос ниже
        if !queueArray.isEmpty{
            return queueArray.removeFirst()
        }
        return nil
    }
    
    func peek() -> ItemType? {   // <<< Вопрос ниже
        if !queueArray.isEmpty{
            return queueArray[0]
        }
        return nil
    }
    
    func findNumberOf(function: (ItemType) -> Bool) -> Int {
        var count = 0
        for item in queueArray {
            if function(item) {
                count += 1
            }
        }
        return count
    }
    
    func changeQueue(function: (ItemType) -> ItemType) -> [ItemType] {
        var newArray: [ItemType] = []
        for item in queueArray {
            newArray.append(function(item))
        }
        return newArray
    }
    
    subscript(index: UInt) -> ItemType? {
        if index < queueArray.count {
            return queueArray[Int(index)]
        } else {
            return nil
        }
    }
}

var queue1 = Queue<Int>()
queue1.enqueue(item: 1)
queue1.enqueue(item: 56)
queue1.enqueue(item: 14)
queue1.enqueue(item: 16)

if let a = queue1.peek() { // Правильно ли я понимаю, что это единственный правильный способ получить значение из очереди, не поймав ошибку, если она окажется пустой?
    print(a)
}
if let a = queue1.dequeue() {
    print(a)
}
if let a = queue1.peek() {
    print(a)
}
if let a = queue1.dequeue() {
    print(a)
}
if let a = queue1.peek() {
    print(a)
}
if let a = queue1.dequeue() {
    print(a)
}
if let a = queue1.peek() {
    print(a)
}
if let a = queue1.dequeue() {
    print(a)
}
if let a = queue1.peek() { // <- Нет предупреждения, все ок
    print(a)
}
print(queue1.peek()) // <- Предупреждение Xcode, но работает, тоже самое и с обращением по индексу

queue1.enqueue(item: 14)
queue1.enqueue(item: 14)
queue1.enqueue(item: 14)
print(queue1.findNumberOf() {$0 == 14})

queue1.enqueue(item: 5)
queue1.enqueue(item: 5)
queue1.enqueue(item: 5)
queue1.enqueue(item: 5)
queue1.enqueue(item: 5)
queue1.enqueue(item: 5)
print(queue1.findNumberOf() {$0 > 3})

print(queue1.changeQueue(function: {-$0}))
print(queue1.changeQueue(function: {Int(Double($0) * 0.1)}))

var stringQueue = Queue<String>()
stringQueue.enqueue(item: "Moscow")
stringQueue.enqueue(item: "Berlin")
stringQueue.enqueue(item: "Paris")

print(stringQueue.changeQueue(function: {$0 + " is a big city"}))

print(queue1[6])
print(queue1[18])
print(stringQueue[1])
print(stringQueue[5])
