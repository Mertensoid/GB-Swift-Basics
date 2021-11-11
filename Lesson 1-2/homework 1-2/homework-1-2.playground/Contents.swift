import Foundation

// Задание 1. Написать функцию, которая определяет, четное число или нет.
func isEven(digit: Int) -> Bool {
    if digit % 2 == 0 {
        return true
    } else {
        return false
    }
}


//Задание 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func dividedBy3(digit: Int) -> Bool {
    if digit % 3 == 0 {
        return true
    } else {
        return false
    }
}

//Задание 3. Создать возрастающий массив из 100 чисел.
var incArray: [Int] = []

for i in 1...100 {
    incArray.append(i)
}

//Задание 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for item in 1...100 {
    if (isEven(digit: incArray[100-item]) || !dividedBy3(digit: incArray[100-item])){
        incArray.remove(at: 100-item)
    }
}
print(incArray)

//Задание 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibo(array: inout [Int]) -> () {
    if array.count == 0 {
        array.append(1)
    } else if array.count == 1{
        array.append(1)
    } else {
        array.append(array[array.count-1] + array[array.count-2])
    }
}

var fiboArrayClear: [Int] = []
var fiboArray: [Int] = [1,1]

for _ in 1...50 {
    fibo(array: &fiboArrayClear)
}

for _ in 1...50 {
    fibo(array: &fiboArray)
}
print(fiboArrayClear)
print(fiboArray)

// Задание 6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

// Мой невероятный метод =)
var array: [Int] = []

array.append(2)
array.append(3)
var i = 4

while array.count < 100 {
    var check = false
    for x in array {
        if i % x == 0 {
            check = true
        }
    }
    if !check {
        array.append(i)
    }
    i += 1
}

print(array)
print(array.count)

// Метод Эратосфена
var eratosphenArray = [Int](2...700)

for divider in eratosphenArray {
    for item in eratosphenArray{
        if item % divider == 0 && item != divider {
            eratosphenArray.remove(at: eratosphenArray.firstIndex(of: item)!)
        }
    }
    
    if eratosphenArray.count > 100 {
        eratosphenArray.removeLast()
    }
}

print(eratosphenArray)
print(eratosphenArray.count)

