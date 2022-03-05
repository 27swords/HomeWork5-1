//
//  main.swift
//  HomeWork5-1
//
//  Created by Alexander Chervoncev on 2.03.22.
//

import Foundation

enum CarEngineStatus {
    case launched
    case turdenOff
}
enum CarWindowsStatus {
    case open
    case close
}
enum CarTrunkStatus {
    case putInTrunk
    case takeFromTrunk
}

protocol Carable {
    var carModel: String { get }
    var carYearRelease: Int { get }
    var carEngine: CarEngineStatus { get set }
    var carWindows: CarWindowsStatus { get set }
    var carTrunk: CarTrunkStatus { get set }
    
    mutating func engineAction(type: CarEngineStatus)
    mutating func windowsAction(type: CarWindowsStatus)
    mutating func trunkAction(type: CarTrunkStatus)
}

extension Carable {
    
    mutating func windowsAction(type: CarWindowsStatus) {
        switch type {
        case .open:
            carWindows = .open
            print("Windows openned")
        case .close:
            carWindows = .close
            print("Windows closed")
        }
    }

    mutating func trunkAction(type: CarTrunkStatus) {
        switch type {
        case .putInTrunk:
            carTrunk = .putInTrunk
            print("Trunk loaded")
        case .takeFromTrunk:
            carTrunk = .takeFromTrunk
            print("Trunk empty")
        }
    }

    mutating func engineAction(type: CarEngineStatus) {
        switch type {
        case .launched:
            carEngine = .launched
            print("Engine launched")
        case .turdenOff:
            carEngine = .turdenOff
            print("Engine stopped")
        }
    }
}

final class SportCar: Carable, CustomStringConvertible {
    
    enum CarHatchStatus {
        case open
        case close
    }

    var carModel: String
    var carYearRelease: Int
    var carTrunk: CarTrunkStatus
    var carEngine: CarEngineStatus
    var carWindows: CarWindowsStatus
    var carHatch: CarHatchStatus
    var description: String {
        return """

            Spor car discription:
    Model: \(carModel)
    Year release: \(carYearRelease)
    Engine: \(carEngine)
    Windows: \(carWindows)
    Trunk: \(carTrunk)
    Hatch: \(carHatch)

            Action:
"""
    }

    init(carModel: String,
         carYearRelease: Int,
         carTrunk: CarTrunkStatus,
         carEngine: CarEngineStatus,
         carWindows: CarWindowsStatus,
         carHatch: CarHatchStatus) {
        
        self.carModel = carModel
        self.carYearRelease = carYearRelease
        self.carTrunk = carTrunk
        self.carEngine = carEngine
        self.carWindows = carWindows
        self.carHatch = carHatch
    }

    func HatchAtion(type: CarHatchStatus) {
        switch type {
        case .open:
            carHatch = .open
            print("Hatch openned")
        case .close:
            carHatch = .close
            print("Hatch closed")
        }
    }
}

var mazda = SportCar(carModel: "Rx-7",
                     carYearRelease: 2002,
                     carTrunk: .takeFromTrunk,
                     carEngine: .launched,
                     carWindows: .open,
                     carHatch: .open)

let mazdaDiscription = mazda.description
print(mazdaDiscription)

mazda.windowsAction(type: .close)
mazda.HatchAtion(type: .close)
mazda.engineAction(type: .turdenOff)
mazda.trunkAction(type: .putInTrunk)

print("+++++++++++++++++++++++++++++++++")

final class TrunkCar: Carable, CustomStringConvertible {
    
    enum carCruiseControlStatus {
        case on
        case off
    }

    var carModel: String
    var carYearRelease: Int
    var carTrunk: CarTrunkStatus
    var carEngine: CarEngineStatus
    var carWindows: CarWindowsStatus
    var carCruiseControl: carCruiseControlStatus
    var description: String {
        return """
            Trunk car description
    Model: \(carModel)
    Year release: \(carYearRelease)
    Engine: \(carEngine)
    Trunk: \(carTrunk)
    Windows: \(carWindows)
    Cruise control: \(carCruiseControl)

                Actions:
"""
    }

    init(carModel: String,
         carYearRelease: Int,
         carTrunk: CarTrunkStatus,
         carEngine: CarEngineStatus,
         carWindows: CarWindowsStatus,
         carCruiseControl: carCruiseControlStatus) {
        
        self.carModel = carModel
        self.carYearRelease = carYearRelease
        self.carTrunk = carTrunk
        self.carEngine = carEngine
        self.carWindows = carWindows
        self.carCruiseControl = carCruiseControl
    }

    func CruiseControlAction(type: carCruiseControlStatus) {
        switch type {
        case .off:
            carCruiseControl = .off
            print("Cruise control off")
        case .on:
            carCruiseControl = .on
            print("Cruise control on")
        }
    }
}

var volvo = TrunkCar(carModel: "volvo",
                     carYearRelease: 2021,
                     carTrunk: .putInTrunk,
                     carEngine: .launched,
                     carWindows: .close,
                     carCruiseControl: .on)

let volvoDiscription = volvo.description
print(volvoDiscription)

volvo.windowsAction(type: .open)
volvo.CruiseControlAction(type: .off)
volvo.engineAction(type: .turdenOff)
volvo.trunkAction(type: .takeFromTrunk)


