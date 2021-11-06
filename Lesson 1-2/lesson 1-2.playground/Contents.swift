import UIKit

var a = 5
var b = 10

a = a * b
a *= b

// логические операторы

//И

(a > 100) && (b < 15)
true && true // true
true && false // false
false && true // false
false && false //false

//ИЛИ

(a > 100) && (b < 15)
true || true // true
true || false // true
false || true // true
false || false //false

//НЕ

!true // false
!false // true

//Ветвление
//if else

if (a > 50) && (b > 15) {
    print("a > 50")
} else if a < 1000 {
    print("a < 1000")
} else {
    print ("TEST")
}

//тернарный оператор

a == 5 ? print("a == 5") : print("a != 5")

var h  = 100
var isH = true
let r = h + (isH ? 20 : 10)
print (r)

// switch

let userMark = 40

switch userMark {
case 1:
    print("userMark == 1")
case 2,3:
    print("НЕ СДАН")
case 4:
    print("Хорошо")
case 5:
    print("Отлично")
default:
    print("Студент не пришел")
}

let level: Character = "B"

switch level {
case "A":
    print("All ok")
case "B":
    print("Good")
    fallthrough
case "C":
    print("Bad")
default:
    break
}

var aa = 19
var bb = 7
var cc = 89

var D = (bb * bb) - 4 * aa * cc

switch D {
case _ where D > 0:
    print("2 roots")
case _ where D == 0:
    print("1 root")
default:
    print("no roots")
}

//for in

var totalSum = 0
for i in 1...10 {
    totalSum += i
}
print(totalSum)

var musicStyleArray = ["Rock", "Hip-Hop", "Classical"]

for musicStyle in musicStyleArray {
    print("I like \(musicStyle)")
}

var country = ["Россия":"ЕАЭС", "США":"НАТО", "Франция":"ЕС"]

for (countryName, countryBlock) in country {
    print("\(countryName) в \(countryBlock)")
}

//while

var i = 1
var resultSumWhile = 0

while i <= 10 {
    resultSumWhile += i
    i += 1
}
print(resultSumWhile)

//repeat - while

var t = 1
var resultSumRepeat = 0

repeat {
    resultSumRepeat += t
    t += 1
} while t <= 10
            
print(resultSumRepeat)

    //Функции

func myFirstFunction(firstArg argument: Int, another: Int, _ value: Int) -> Int{
    let summa = argument + another + value
    return summa
}

print(myFirstFunction(firstArg: 10, another: 14, 6))


//сквозная функция, сквозные переменные
var k = 190
var g = 204

func change(a: inout Int, b: inout Int) -> (){
    let tmp = a
    a = b
    b = tmp
}

print(k)
print(g)
change(a: &k, b: &g)
print(k)
print(g)


