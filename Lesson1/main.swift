//
// main.swift
// Lesson1
//
// Created by Ksusha on 28.12.2020.
//

import Foundation

// 1. Решить квадратное уравнение.
// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// 3.* Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

//1
print("*********** Задание 1 ************")
var x: Double
var y: Double = 0
let z: Double = -7

print("x2 + z*x = y")
print("x · (x + z) = y")
print("x1 = y")
y = -(z)/1;
print("x2 = −(z)/1 = \(y)")

//2
print("*********** Задание 2 *********")
var a: Double = 7
var b: Double = 5

var gipotTri = sqrt(pow(a,2) + pow(b,2))

var squareTri = (a * b) / 2
var perimTri = a + b + gipotTri

print("Гипотенуза треугольника: \(gipotTri)")
print("Площадь треугольника: \(squareTri)")
print("Периметр треугольника: \(perimTri)")

//3
print("********* Задание 3 ***********")
var summaVklada: Double = 2100000
var percent: Double = 10.75
var summaAfterYears: Double
var k = 365
var t = 5 * k
//S=(P*I*t:K):100
//Обозначения:
//S – начисленный профит
//P – сумма вклада
//I – годовая ставка по депозиту
//t – срок депозита (к-во дней)
//K – число дней в году (при расчете процентов всегда берется 365 дней, даже в високосный год)
summaAfterYears = (summaVklada * percent * 5) / 100 + summaVklada
print("Сумма вклада через 5 лет = \(summaAfterYears)")
