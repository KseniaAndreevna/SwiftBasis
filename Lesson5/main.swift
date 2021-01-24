//
//  main.swift
//  Lesson5
//
//  Created by Ksusha on 23.01.2021.
//

import Foundation

//Задание по уроку №5
//
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.


// 1 пункт

enum CarActions {
    case openDoor
    case closeDoor
    case openWindow
    case closeWindow
    case startEngine
    case stopEngine
    case openTrunk
    case closeTrunk
    case speedUp //разгоняться
    case slowDown //тормозить
}

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

struct DefaultSettings {
    var isWindowOpen: Bool = false
    var isDoorOpen: Bool = false
    var isEngineStarted: Bool = false
}

protocol Car {
    var brand: CarBrand { get set }
    var model: String { get set }
    var numbers: String { get set }
    var gearboxType: GearboxType { get set }
    var color: CarColor { get set }
    var isDoorOpen: Bool { get set }
    var isWindowOpen: Bool { get set }
    var isEngineStarted: Bool { get set }
    var defaultSettings: DefaultSettings { get set }
    mutating func doAction(_ action: CarActions)
}

// 2 пункт

extension Car {
    var isDoorOpen: Bool {
        get {
            return defaultSettings.isWindowOpen
        }
        set {
            defaultSettings.isWindowOpen = newValue
        }
    }
    
    var isWindowOpen: Bool {
        get {
            return defaultSettings.isWindowOpen
        }
        set {
            defaultSettings.isWindowOpen = newValue
        }
    }
    
    var isEngineStarted: Bool {
        get {
            return defaultSettings.isEngineStarted
        }
        set {
            defaultSettings.isEngineStarted = newValue
        }
    }
    
    mutating func openDoor() {
        self.isDoorOpen = true
    }
    
    mutating func closeDoor() {
        self.isDoorOpen = false
    }
    
    mutating func openWindow() {
        self.isWindowOpen = true
    }
    
    mutating func closeWindow() {
        self.isWindowOpen = false
    }
    
    mutating func startEngine() {
        self.isEngineStarted = true
    }
    
    mutating func stopEngine() {
        self.isEngineStarted = false
    }
    
    mutating func doAction(_ action: CarActions) {
        switch action {
        case .openDoor:
            self.isDoorOpen = true
        case .closeDoor:
            self.isDoorOpen = false
        case .openWindow:
            self.isWindowOpen = true
        case .closeWindow:
            self.isWindowOpen = false
        case .startEngine:
            self.isEngineStarted = true
        case .stopEngine:
            self.isEngineStarted = false
        default:
            break
        }
        print("Car action - \(action)")
     }
}

// 3 пункт


class SportCar: Car {
    var brand: CarBrand = .Audi
    
    var model: String = "XR"
    
    var numbers: String = "RT567Z"
    
    var gearboxType: GearboxType = .AT
    
    var color: CarColor = .black
    
    var defaultSettings: DefaultSettings = DefaultSettings()
    
    var isCarMove: Bool = true
    
    func doAction(_ action: CarActions) {
        switch action {
        case .speedUp:
            self.isCarMove = true
        case .slowDown:
            self.isCarMove = false
        default:
            break
        }
        print("SportCar action - \(action)")
    }
    
}


class TrunkCar: Car {
    var brand: CarBrand = .BMW
    
    var model: String = "FRI"
    
    var numbers: String = "EW679J"
    
    var gearboxType: GearboxType = .manual
    
    var color: CarColor = .red
    
    var defaultSettings: DefaultSettings = DefaultSettings()
    
    var isTrunkOpen: Bool = true
    
    func doAction(_ action: CarActions) {
        switch action {
        case .openTrunk:
            self.isTrunkOpen = true
        case .closeTrunk:
            self.isTrunkOpen = false
        default:
            break
        }
    print("TrunkCar action - \(action)")
    }
    
}

// 4 пункт

extension SportCar: CustomStringConvertible {
    var description: String {
        return "isCarMove \(self.isCarMove)"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "isTrunkOpen: \(self.isTrunkOpen)"
    }
}

// 5-6 пункты

var sportCar = SportCar ()
sportCar.doAction(.openDoor)
sportCar.openWindow()
sportCar.closeWindow()
sportCar.closeDoor()
sportCar.startEngine()
sportCar.doAction(.speedUp)
sportCar.description

var trunkCar = TrunkCar ()
trunkCar.doAction(.openTrunk)
trunkCar.startEngine()
trunkCar.description
