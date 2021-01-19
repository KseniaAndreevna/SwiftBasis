//
//  main.swift
//  Lesson4
//
//  Created by Ksusha on 19.01.2021.
//

import Foundation

//Задание по уроку №4
//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


//---------------------- Перечисления --------------------------
enum CarBrand {
    case BMW, Volvo, Saab, Audi, Toyota
}

enum CarColor: String {
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

enum GearboxType: String {
    case manual = "ручная"
    case AT = "автомат"
}

enum EngineState: String {
    case started = "запущен"
    case stopped = "остановлен"
}

enum WindowState: String{
    case open = "открыты"
    case close = "закрыты"
}

enum LuggageState: String{
    case empty = "пустой"
    case full = "полный"
}

enum LuggageAction {
    case inCar (with: Double)
    case outCar (with: Double)
}

enum CarActions {
    case openDoor
    case closeDoor
    case openWindow
    case closeWindow
    case openTrunk
    case closeTrunk
    case startEngine
    case stopEngine
    case speedUp //разгоняться
    case slowDown //тормозить
}

//---------------------- Классы --------------------------

class Car {
    init() {}
    var brand: CarBrand?
    var model: String?
    var numbers: String?
    var gearboxType: GearboxType?
    var color: CarColor?
    func changingColor(color: CarColor) {
        self.color = color
    }
    
    var year: Int?
    var luggageVolume: Double?
    var bodyVolume: Double?
    var filledLuggageVolume: Double?
    var emptyLuggageVolume: Double? {
        return luggageVolume! - filledLuggageVolume!
    }
    var isWindowOpen: Bool = false
    var isDoorOpen: Bool = false
    var isCarMove: Bool = false
    
    func doAction (_ action: CarActions) {
        switch action {
        case .closeDoor:
            isDoorOpen = false
        case .openDoor:
            isDoorOpen = true
        case .closeWindow:
            isWindowOpen = false
        case .openWindow:
            isWindowOpen = true
        case .slowDown:
            isCarMove = false
        case .speedUp:
            isCarMove = true
        default:
            print("Невозможно выполнить действие: \(action)")
        }
    }
    
    func printInfo() {
        print("Car - \(String(describing: brand))")
        print("Окна открыты - \(isWindowOpen)")
        print("Двери открыты - \(isDoorOpen)")
        print("Авто ускоряется - \(isCarMove)")
    }
}

class SportCar: Car {
    var isEngineStarted: Bool = false
    
    init(isEngineStarted: Bool) {
        self.isEngineStarted = isEngineStarted
        super.init()
    }
    
    override func doAction(_ action: CarActions) {
        super.doAction(action)
        
        switch action {
        case .startEngine:
            isEngineStarted = true
        case .stopEngine:
            isEngineStarted = false
        default:
            print("Машина не умеет делать действие: \(action)")
        }
    }
    
    override func printInfo() {
        print("SportCar - \(String(describing: brand))")
        super.printInfo()
        print("Двигатель заведен - \(isEngineStarted)")
    }
}

class TrunkCar: Car {
    var isTrunkOpen: Bool = false
    
    init(isTrunkOpen: Bool) {
        self.isTrunkOpen = isTrunkOpen
        super.init()
    }
    
    override func doAction(_ action: CarActions) {
        super.doAction(action)
        
        switch action {
        case .openTrunk:
            isTrunkOpen = true
        case .closeTrunk:
            isTrunkOpen = false
        default:
            print("Машина не умеет делать действие: \(action)")
        }
    }
    
    override func printInfo() {
        print("TrunkCar - \(String(describing: brand))")
        super.printInfo()
        print("Багажник открыт - \(isTrunkOpen)")
    }
}

//-------------- Наполнение объектов ----------------------

let car0 = Car()
let sportCar0 = SportCar(isEngineStarted: true)
let trunkCar0 = TrunkCar(isTrunkOpen: false)

car0.brand = .BMW
car0.gearboxType = .AT
car0.color = .golden
car0.model = "XVR"
car0.numbers = "GT657K"
car0.doAction(.slowDown)

sportCar0.brand = .Toyota
sportCar0.color = .black
sportCar0.gearboxType = .manual
sportCar0.bodyVolume = 1000
sportCar0.year = 2019
sportCar0.numbers = "FR777K"
sportCar0.doAction(.closeDoor)
sportCar0.doAction(.closeTrunk)
sportCar0.doAction(.openWindow)
sportCar0.doAction(.startEngine)

trunkCar0.brand = .Volvo
trunkCar0.color = .grey
trunkCar0.gearboxType = .manual
trunkCar0.numbers = "PP999O"
trunkCar0.luggageVolume = 10000
trunkCar0.doAction(.closeTrunk)
trunkCar0.doAction(.speedUp)
trunkCar0.doAction(.openWindow)

//---------------------- Вывод на печать --------------------------

print("*********************************")

car0.printInfo()

print("*********************************")

sportCar0.printInfo()

print("*********************************")

trunkCar0.printInfo()

print("*********************************")

print ("Информация по обычному авто: \(String(describing: car0.brand)) \(String(describing: car0.model)) \(String(describing: car0.numbers)), год выпуска: \(String(describing: car0.year)), коробка передач: \(String(describing: car0.gearboxType?.rawValue)), цвет: \(String(describing: car0.color?.rawValue)), объем багажника: \(String(describing: car0.luggageVolume)).")

print("*********************************")

print ("Информация по спорт.авто: \(String(describing: sportCar0.brand)) \(String(describing: sportCar0.model)) \(String(describing: sportCar0.numbers)), год выпуска: \(String(describing: sportCar0.year)), коробка передач: \(String(describing: sportCar0.gearboxType?.rawValue)), цвет: \(String(describing: sportCar0.color?.rawValue)), объем багажника: \(String(describing: sportCar0.luggageVolume)).")

print("*********************************")

print ("Информация по грузовому авто: \(String(describing: trunkCar0.brand)) \(String(describing: trunkCar0.model)) \(String(describing: trunkCar0.numbers)), год выпуска: \(String(describing: trunkCar0.year)), коробка передач: \(String(describing: trunkCar0.gearboxType?.rawValue)), цвет: \(String(describing: trunkCar0.color?.rawValue)), объем багажника: \(String(describing: trunkCar0.luggageVolume)).")



// РЕЗУЛЬТАТ ВЫПОЛНЕНИЯ ТАКОЙ:
//
//Машина не умеет делать действие: closeDoor
//Невозможно выполнить действие: closeTrunk
//Машина не умеет делать действие: closeTrunk
//Машина не умеет делать действие: openWindow
//Невозможно выполнить действие: startEngine
//Невозможно выполнить действие: closeTrunk
//Машина не умеет делать действие: speedUp
//Машина не умеет делать действие: openWindow
//*********************************
//Car - Optional(Lesson4.CarBrand.BMW)
//Окна открыты - false
//Двери открыты - false
//Авто ускоряется - false
//*********************************
//SportCar - Optional(Lesson4.CarBrand.Toyota)
//Car - Optional(Lesson4.CarBrand.Toyota)
//Окна открыты - true
//Двери открыты - false
//Авто ускоряется - false
//Двигатель заведен - true
//*********************************
//TrunkCar - Optional(Lesson4.CarBrand.Volvo)
//Car - Optional(Lesson4.CarBrand.Volvo)
//Окна открыты - true
//Двери открыты - false
//Авто ускоряется - true
//Багажник открыт - false
//*********************************
//Информация по обычному авто: Optional(Lesson4.CarBrand.BMW) Optional("XVR") Optional("GT657K"), год выпуска: nil, коробка передач: Optional("автомат"), цвет: Optional("golden"), объем багажника: nil.
//*********************************
//Информация по спорт.авто: Optional(Lesson4.CarBrand.Toyota) nil Optional("FR777K"), год выпуска: Optional(2019), коробка передач: Optional("ручная"), цвет: Optional("черный"), объем багажника: nil.
//*********************************
//Информация по грузовому авто: Optional(Lesson4.CarBrand.Volvo) nil Optional("PP999O"), год выпуска: nil, коробка передач: Optional("ручная"), цвет: Optional("серый"), объем багажника: Optional(10000.0).
//Program ended with exit code: 0



//Есть вопросы:
//1) не смогла разобраться с тем, почему повторяется сначала текст:
   // Машина не умеет делать действие: closeDoor
   // Невозможно выполнить действие: closeTrunk
   // Машина не умеет делать действие: closeTrunk
//2) как вывести без "Optional" в тексте "Optional(Lesson4.CarBrand.BMW)"?
// икскод предлагает только такой вывод для опциональных переменных...
