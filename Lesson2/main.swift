//
//  main.swift
//  Lesson2
//
//  Created by Ksusha on 28.12.2020.
//

import Foundation
print("******* УРОК 2 *******")
/*
 1. Написать функцию, которая определяет, четное число или нет.
 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
 3. Создать возрастающий массив из 100 чисел.
 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
 Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
 */

//1
print("******* ЗАДАНИЕ 1 *******")
func getEvenNumber (nmb: Int) -> Int {
    var isEven: Int
    if nmb % 2 == 0 {
      isEven = 0
      print("Число \(nmb) - четное")
    }
    else {
      isEven = 1
      print("Число \(nmb) - нечетное")
    }
    return isEven
}

var res: Int
res = getEvenNumber(nmb: 17);
res = getEvenNumber(nmb: 20);


//2
print("******* ЗАДАНИЕ 2 *******")
func getModNumber (nmb: Int, modul: Int) -> Int {
    var isMod: Int
    if nmb % modul == 0 {
      isMod = 0
      print("Число \(nmb) делится на \(modul) БЕЗ остатка")
    }
    else {
      isMod = 1
      print("Число \(nmb) делится на \(modul) С остатком")
    }
    return isMod
}

res = getModNumber(nmb: 18, modul: 3);
res = getModNumber(nmb: 40, modul: 3);


//3
print("******* ЗАДАНИЕ 3 *******")
var numberArray = [Int](1...100)
print(numberArray)


//4
print("******* ЗАДАНИЕ 4 *******")
for i in (0...numberArray.count-1).reversed() {
    if getEvenNumber(nmb: numberArray[i]) == 0 || getModNumber(nmb: numberArray[i], modul: 3) == 1 {
        numberArray.remove(at: i)
    }
}
print(numberArray)

//5
print("******* ЗАДАНИЕ 5 (INT) *******")
var fibNumber: Int
func getFibonacci(f: Int) -> Int {
    if f < 2 { return f }
    else { return fibArray[f - 1] + fibArray[f - 2]}
}

var fibArray = [Int]()
for i in (0...90) {
    fibArray.append(getFibonacci(f: i))
}
print("Добавлено \(fibArray.count) чисел Фибоначчи - при попытке добавить 100 возникает ошибка при типе Int (Thread 1: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0)).")
print(fibArray)

print("******* ЗАДАНИЕ 5 (DOUBLE) *******")
var fibNumberDouble: Double
func getFibonacciDouble(f: Double) -> Double {
    if f < 2 { return Double(f) }
    else { return fibArrayDouble[Int(f) - 1] + fibArrayDouble[Int(f) - 2]}
}

var fibArrayDouble = [Double]()
for i in (0...99) {
    fibArrayDouble.append(getFibonacciDouble(f: Double(i)))
}
print("Добавлено \(fibArrayDouble.count) чисел Фибоначчи (Double)")
print(fibArrayDouble)


//6
print("******* ЗАДАНИЕ 6 *******")
var p = 2
var n = 55
var simpleNumArray = [Int] (0...n)
//print(simpleNumArray)
simpleNumArray[1] = 0

var i = p
var j: Int
while i <= n - 1 {
    if simpleNumArray[i] != 0 {
        j = i + i
        while j <= n - 1 {
            simpleNumArray[j] = 0
            j = j + i
        }
    }
    i += 1
}

 for i in (0...n - 1).reversed() {
     if simpleNumArray[i] == 0 {
         simpleNumArray.remove(at: i)
     }
 }
 print(simpleNumArray)
