//
//  main.swift
//  Lesson3
//
//  Created by Ksusha on 12.01.2021.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum carBrand {
    case BMW, Volvo, Saab, Audi, Toyota
}

enum carColor: String {
    case white = "белый"
    case black = "черный"
    case grey = "серый"
    case red = "красный"
    case blue = "синий"
    case green = "зеленый"
    case violet
    case yellow
    case orange
    case brown = "коричневый"
    case pink = "розовый"
    case purple
    case silver
    case golden
    case nocolor
}

enum gearboxType: String {
    case manual = "ручная"
    case AT = "автомат"
}

enum engineState: String {
    case started = "запущен"
    case stopped = "остановлен"
}

enum windowState: String{
    case open = "открыты"
    case close = "закрыты"
}

enum luggageState: String{
    case empty = "пустой"
    case full = "полный"
}
 
enum luggageAction {
    case inCar (with: Double)
    case outCar (with: Double)
}

//struct Car {
//    var brand: carBrand
//    var model: String
//    var numbers: String
//    var gearboxType: gearboxType
//    var color: carColor
//    mutating func changingColor(color:carColor) {
//        switch color {
//        case carColor.white:
//            self.color = carColor.white
//        case carColor.black:
//            self.color = carColor.black
//        case carColor.brown:
//            self.color = carColor.brown
//        case carColor.grey:
//            self.color = carColor.grey
//        case carColor.red:
//            self.color = carColor.red
//        case carColor.blue:
//            self.color = carColor.blue
//        default:
//            print("Color changing error.")
//        }
//    }
//    var year: Int { get }
//    var luggageVolume: Double
//    var bodyVolume: Double
//    var luggageState: luggageState
//    var filledLuggageVolume: Double
//    var windowState: windowState
//    var engineState: engineState {
//            willSet {
//                if newValue == .started {
//                    print ("Car \(brand)\(model)\(numbers) engine switched on!")
//                } else {
//                    print("Car \(brand)\(model)\(numbers) engine switched off!")
//                }
//            }
//        }
//}

struct SportCar {
    var brand: carBrand
    var model: String
    var numbers: String
    var gearboxType: gearboxType
    var color: carColor
    mutating func changingColor(color:carColor) {
        self.color = color
    }
    var year: Int
    var luggageVolume: Double
    var bodyVolume: Double
    var luggageState: luggageState
    var filledLuggageVolume: Double
    var emptyLuggageVolume: Double {
        return luggageVolume - filledLuggageVolume
    }
    mutating func doAction (_ action: luggageAction) {
        switch action {
        case let luggageAction.inCar(with: value):
         guard filledLuggageVolume + value < luggageVolume
         else {
             print ("Нельзя добавить в багажник!")
             return
         }
         self.filledLuggageVolume += value
         print ("В багажник добавлено \(value), осталось \(self.emptyLuggageVolume)!")
        case let luggageAction.outCar(with: value):
         guard filledLuggageVolume - value >= 0
         else {
           print ("Нельзя убрать из багажника!")
                return
            }
            self.filledLuggageVolume -= value
            print ("Из багажника убрано \(value), осталось \(self.emptyLuggageVolume)!")
        }
       
    }
    var windowState: windowState
    var engineState: engineState {
            willSet {
                if newValue == .started {
                    print ("Car \(brand) \(model) \(numbers) engine switched on!")
                } else {
                    print("Car \(brand) \(model) \(numbers) engine switched off!")
                }
            }
        }
}

struct TruckCar {
    var brand: carBrand
    var model: String
    var numbers: String
    var gearboxType: gearboxType
    var color: carColor
    mutating func changingColor(color:carColor) {
        self.color = color
    }
    var year: Int
    var luggageVolume: Double
    var bodyVolume: Double
    var luggageState: luggageState
    var filledLuggageVolume: Double
    var windowState: windowState
    var engineState: engineState {
            willSet {
                if newValue == .started {
                    print ("Car \(brand) \(model) \(numbers) engine switched on!")
                } else {
                    print("Car \(brand) \(model) \(numbers) engine switched off!")
                }
            }
        }
}

var sportCar1 = SportCar(brand: carBrand.BMW, model: "XSR", numbers: "FR777K", gearboxType: gearboxType.manual, color: carColor.black, year: 2019, luggageVolume: 1000.45, bodyVolume: 1000, luggageState: luggageState.empty, filledLuggageVolume: 99.55, windowState: windowState.open, engineState: engineState.started)

var truckCar1 = TruckCar(brand: .Saab, model: "X45", numbers: "PP999O", gearboxType: .AT, color: .red, year: 2020, luggageVolume: 10000, bodyVolume: 7000, luggageState: .full, filledLuggageVolume: 8956.70, windowState: .close, engineState: .stopped)

sportCar1.engineState = .started
sportCar1.changingColor(color: carColor.red)
sportCar1.filledLuggageVolume = 10
sportCar1.doAction(.inCar(with: 123.88))
sportCar1.doAction(.outCar(with: 100))

truckCar1.changingColor(color: carColor.blue)
truckCar1.filledLuggageVolume = 1090.55
truckCar1.windowState = windowState.open

print ("Информация по авто: \(sportCar1.brand) \(sportCar1.model) \(sportCar1.numbers), год выпуска: \(sportCar1.year), коробка передач: \(sportCar1.gearboxType.rawValue), цвет: \(sportCar1.color.rawValue), объем багажника: \(sportCar1.luggageVolume), двигатель \(sportCar1.engineState.rawValue).")

print ("Информация по авто: \(truckCar1.brand) \(truckCar1.model) \(truckCar1.numbers), год выпуска: \(truckCar1.year), коробка передач: \(truckCar1.gearboxType.rawValue), цвет: \(truckCar1.color.rawValue), объем багажника: \(truckCar1.luggageVolume), двигатель \(truckCar1.engineState.rawValue).")
