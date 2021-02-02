//
//  main.swift
//  Lesson7
//
//  Created by Ksusha on 28.01.2021.
//

import Foundation

// Урок №7

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
//

// Задание 1
enum TeapotError: Error {
    case noWater
    case switchedOff
    case notInSocket
    case tooMuchWater(Int)
    case cantAddWaterLidClosed
    case lidAlreadyOpen
    case lidAlreadyClosed
}

class Teapot {
    var isOpen: Bool = true
    var isInSocket: Bool = true
    var isSwitchedOn: Bool = false
    var maxVolume: Int = 1000 //ml
    var minFilledVolume: Int = 100 //ml
    var filledVolume: Int = 0

    //добавление воды в чайник
    func addWater(_ value: Int) -> (Int?, TeapotError?) {
        guard isOpen else {
            return (nil, .cantAddWaterLidClosed)
        }
        
        guard value + filledVolume <= maxVolume else {
            return (nil, .tooMuchWater(filledVolume))
        }
        
        filledVolume += value
        return (filledVolume, nil)
    }
    
    //кипячение воды
    func boilWater() -> (Int?, TeapotError?) {
        guard isInSocket else {
            return (nil, .notInSocket)
        }
        
        guard isSwitchedOn else {
            return (nil, .switchedOff)
        }
        
        guard filledVolume <= minFilledVolume else {
            return (nil, .noWater)
        }
        
        return (filledVolume, nil)
    }
    
    //налить чашку чая
    func pourCupOfTea(_ value: Int) -> (Int?, TeapotError?) {
        guard filledVolume - value >= 0 else {
            return (nil, .noWater)
        }
        
        filledVolume -= value
        return (filledVolume, nil)
    }
    
    //открыть чайник
    func open() -> (Bool?, TeapotError?) {
        guard !isOpen else {
            return (nil, .lidAlreadyOpen)
        }
        
        return (isOpen, nil)
    }
    
    //закрыть чайник
    func close() -> (Bool?, TeapotError?) {
        guard isOpen else {
            return (nil, .lidAlreadyClosed)
        }
        
        return (isOpen, nil)
    }
}


// Задание 2
enum CupError: Error {
    case lidOnCup
    case dirtyCup
    case noWater
    case tooMuchWater(Int)
    case cantAddWaterLidOnCup
}

class Cup {
    var maxVolume: Int = 250
    var filledVolume: Int = 200
    var isClean: Bool = true
    var isOpen: Bool = true
 
  //налить чашку чая
  func pourCupOfTea(_ value: Int) throws -> Int {
    guard isClean else {
        throw CupError.dirtyCup
    }

    guard value + filledVolume <= maxVolume else {
        throw CupError.tooMuchWater(filledVolume)
    }

    filledVolume += value
    return filledVolume
}

 func drinkTea(_ value: Int) throws -> Int {
    guard isOpen else {
        throw CupError.cantAddWaterLidOnCup
    }

    guard filledVolume - value >= 0 else {
        throw CupError.noWater
    }
    
    filledVolume -= value
    return filledVolume
}

}

let teapot = Teapot()

teapot.close()
teapot.open()
print(teapot.addWater(2000)) //cantAddWaterLidClosed

//
let cup = Cup()

do {
    let vol = try cup.drinkTea(50)
    print("\(vol) in cup")
} catch let error {
    print(error)
} // ошибка noWater

// Не могу разобраться, почему возвращает nil при попытке налить воды больше чем можно
let addVol = try? cup.pourCupOfTea(100)
print("\(addVol) in cup")
//let pourCup: Int = try cup.pourCupOfTea(150)
//print(pourCup)
//print(cup.filledVolume)
