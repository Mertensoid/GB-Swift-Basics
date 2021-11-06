import UIKit

// Задание 1. Решить квадратное уравнение.

//Коэффициент перед x^2
let a: Double = 2
//Коэффициент перед x
let b: Double = 4
//Свободный член
let c: Double = 2

let disc: Double = (b * b) - (4 * a * c)

if disc < 0 {
    print("Квадратное уравнение не имеет решения")
} else {
    let x1 = (-b + sqrt(disc)) / (2 * a)
    let x2 = (-b - sqrt(disc)) / (2 * a)
    if x1 == x2{
        print ("Квадратное уравнение имеет одно решение: x=\(((x1 * 100).rounded()) / 100)")
    } else {
        print ("Квадратное уравнение имеет два решения: x1=\(((x1 * 100).rounded()) / 100) x2=\(((x2 * 100).rounded()) / 100)")
    }
}

// Задание 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let catetA: Double = 3.6
let catetB: Double = 2.5

let gipo = (sqrt((catetA * catetA) + (catetB * catetB)) * 100).rounded() / 100
let perim = ((catetA + catetB + gipo) * 100).rounded() / 100
let square = ((catetA * catetB) / 2 * 100).rounded() / 100

print("Площадь равна \(square)\nПериметр равен \(perim)\nГипотенуза равна \(gipo)\n")

// Задание 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var sum: Double = 1000000
let percent: Double = 6.5

for _ in 1...5 {
    sum = sum + (sum * percent / 100)
}

print("Сумма вклада через 5 лет - \(((sum * 100).rounded()) / 100)")
