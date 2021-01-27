//
//  main.swift
//  Lesson6
//
//  Created by Ksusha on 24.01.2021.
//

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

class Car {
    //init() {}
    var brand: String = "BMW"
    var gearboxType: String = "AT"
    var color: String = "Black"
    var year: Int = 2020
}

extension Car: CustomStringConvertible {
    var description: String {
        return "Auto \(self.brand) (color: \(self.color), gearboxType: \(self.gearboxType), year: \(self.year))"
    }
}

// Создаем очередь
struct Queue <T> {
    private (set) var items: [T] = []
    
    subscript(index: Int) -> T? {
        guard items.indices ~= index else { return nil }
        return items[index]
    }
    
    mutating func addToQueue(_ item: T) {
        self.items.append(item)
    }
    
    mutating func removeFromQueue() {
        self.items.removeFirst()
    }
    
    mutating func removeAll(where condition: (T) -> Bool) {
        for (index, item) in items.enumerated().reversed() {
            if condition(item ) {
                items.remove(at: index)
            }
        }
    }
    
    func filter(_ condition: (T) -> Bool) -> Queue<T> {
    var newArrayOfItems: [T] = []
        for item in items {
            if condition(item) {
                newArrayOfItems.append(item)
            }
        }
        
    var newQueue: Queue<T> = Queue()
    newQueue.items = newArrayOfItems
    return newQueue
    }
}

var queue = Queue<Car>()
var car1 = Car()
car1.brand = "BMW"
car1.color = "Red"
car1.gearboxType = "AT"
car1.year = 2010

var car2 = Car()//все по умолчанию

var car3 = Car()
car3.brand = "Saab"
car3.color = "Blue"
car3.gearboxType = "Manual"
car3.year = 2000

queue.addToQueue(car1)
queue.addToQueue(car2)
queue.addToQueue(car3)
print(queue.items.count)
print(queue.items.description)

queue.removeFromQueue()
print(queue.items.count)
print(queue.items.description)

let filteredQueue = queue.filter({ item in
    return item.brand == "BMW"
})
print(filteredQueue.items.count)
print(filteredQueue.items.description)
//print(queue.items.description)

//не смогла сделать через краткое описание -  $0 == .brand = "BMW"
//let filteredQueue = queue.filter { }
//print(filteredQueue.items)
