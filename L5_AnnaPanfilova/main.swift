//
//  main.swift
//  L5_AnnaPanfilova
//
//  Created by Anna on 30.07.2020.
//  Copyright © 2020 Anna. All rights reserved.
//

import Foundation

enum Color {
    case red, blue, pink, magenta, yellow, violet
}

enum CarManipulations {
    case srartEngine, stopEngine, openWindow, closeWindow, putToTrunk(volume: Double), getFromTrunk(volume: Double), changeColor(color: Color), openRoof, closeRoof, switchOnNitro, switchOffNitro, attachTrailer, detachTrailer, raiseMiddleWheel, downMiddleWheel
}

protocol Car {
    var brand: String { get }
    var model: String { get }
    var volume: Double { get }
    var buildYear: Int { get }
    var trunkSize: Double { get }
    var trunkSizeUsed: Double { get set }
    var isEngineStarted: Bool { get set }
    var isWindowOpened: Bool { get set }
    var color: Color { get set }
    
    func manipulateCar(manipulation: CarManipulations)
    
    func printParams()
}

extension Car {
    
    mutating func putToTrunk(volume: Double) {
        if trunkSize <= trunkSizeUsed + volume {
            trunkSizeUsed += volume
        }
    }
    
    mutating func getFromTrunk(volume: Double) {
        if trunkSizeUsed >= volume {
            trunkSizeUsed -= volume
        }
    }
    
    mutating func startEngine() {
        isEngineStarted = true
    }
    
    mutating func stopEngine() {
        isEngineStarted = false
    }
    
    mutating func openWindow() {
        isWindowOpened = true
    }
    
    mutating func closeWindow() {
        isWindowOpened = false
    }

}

class SportCar: Car, CustomStringConvertible {
    
    var description: String  {
           get {
               return "brand: \(brand), model: \(model), color: \(color), volume: \(volume), buildYear: \(buildYear), trunkSize: \(trunkSize), trunkSizeUsed: \(trunkSizeUsed), isEngineStarted: \(isEngineStarted), isWindowOpened: \(isWindowOpened), isRoofOpened: \(isRoofOpened), isNitroSwitchedOn: \(isNitroSwitchedOn)"
           }
       }
    
    let brand: String
    
    let model: String
    
    let volume: Double
    
    let buildYear: Int
    
    let trunkSize: Double
    
    var trunkSizeUsed: Double
    
    var isEngineStarted: Bool
    
    var isWindowOpened: Bool
    
    var color: Color

    var isRoofOpened: Bool
    
    var isNitroSwitchedOn: Bool

    init(brand: String, model: String, color: Color, volume: Double, buildYear: Int, trunkSize: Double, trunkSizeUsed: Double, isEngineStarted: Bool, isWindowOpened: Bool, isRoofOpened: Bool, isNitroSwitchedOn: Bool) {
        self.brand = brand
        self.model = model
        self.color = color
        self.volume = volume
        self.buildYear = buildYear
        self.trunkSize = trunkSize
        self.trunkSizeUsed = trunkSizeUsed
        self.isEngineStarted = isEngineStarted
        self.isWindowOpened = isWindowOpened
        self.isRoofOpened = isRoofOpened
        self.isNitroSwitchedOn = isNitroSwitchedOn
    }

    func manipulateCar(manipulation: CarManipulations) {
        switch manipulation {
            case .srartEngine:
                isEngineStarted = true
            
            case .stopEngine:
                isEngineStarted = false
            
            case .openWindow:
                isWindowOpened = true
            
            case .closeWindow:
                isWindowOpened = false
            
            case .putToTrunk(volume: let volume):
                if trunkSize <= trunkSizeUsed + volume {
                    trunkSizeUsed += volume
                }
            
            case .getFromTrunk(volume: let volume):
                if trunkSizeUsed >= volume {
                    trunkSizeUsed -= volume
                }
            
            case .changeColor(color: let color):
                self.color = color
            
            case .openRoof:
                isRoofOpened = true
            
            case .closeRoof:
                isRoofOpened = false
            
            case .switchOnNitro:
                isNitroSwitchedOn = true
            
            case .switchOffNitro:
                isNitroSwitchedOn = false
            
            default:
                break
        }
    }
    
    func openRoof() {
        isRoofOpened = true
    }
    
    func closeRoof() {
        isRoofOpened = false
    }
    
    func switchOnNitro() {
        isNitroSwitchedOn = true
    }
    
    func switchOffNitro() {
        isNitroSwitchedOn = false
    }
    
    func printParams() {
        print(description)
    }
    
}

class TrunkCar: Car, CustomStringConvertible {
    
    var description: String {
        get {
            return "brand: \(brand), model: \(model), color: \(color), volume: \(volume), buildYear: \(buildYear), trunkSize: \(trunkSize), trunkSizeUsed: \(trunkSizeUsed), isEngineStarted: \(isEngineStarted), isWindowOpened: \(isWindowOpened), isTrailerAttached: \(isTrailerAttached), isMiddleWheelRaised: \(isMiddleWheelRaised)"
        }
    }
    
    var brand: String
    
    var model: String
    
    var volume: Double
    
    var buildYear: Int
    
    var trunkSize: Double
    
    var trunkSizeUsed: Double
    
    var isEngineStarted: Bool
    
    var isWindowOpened: Bool
    
    var color: Color
    
    var isTrailerAttached: Bool
    
    var isMiddleWheelRaised: Bool
    
     init(brand: String, model: String, color: Color, volume: Double, buildYear: Int, trunkSize: Double, trunkSizeUsed: Double, isEngineStarted: Bool, isWindowOpened: Bool, isTrailerAttached: Bool, isMiddleWheelRaised: Bool) {
         self.brand = brand
         self.model = model
         self.color = color
         self.volume = volume
         self.buildYear = buildYear
         self.trunkSize = trunkSize
         self.trunkSizeUsed = trunkSizeUsed
         self.isEngineStarted = isEngineStarted
         self.isWindowOpened = isWindowOpened
         self.isTrailerAttached = isTrailerAttached
         self.isMiddleWheelRaised = isMiddleWheelRaised
     }
    
    func manipulateCar(manipulation: CarManipulations) {
        switch manipulation {
            case .srartEngine:
                isEngineStarted = true
            
            case .stopEngine:
                isEngineStarted = false
            
            case .openWindow:
                isWindowOpened = true
            
            case .closeWindow:
                isWindowOpened = false
            
            case .putToTrunk(volume: let volume):
                if trunkSize <= trunkSizeUsed + volume {
                    trunkSizeUsed += volume
                }
            
            case .getFromTrunk(volume: let volume):
                if trunkSizeUsed >= volume {
                    trunkSizeUsed -= volume
                }
            
            case .changeColor(color: let color):
                self.color = color
            
            case .attachTrailer:
                isTrailerAttached = true
            
            case .detachTrailer:
                isTrailerAttached = false
            
            case .raiseMiddleWheel:
                isMiddleWheelRaised = true
            
            case .downMiddleWheel:
                isMiddleWheelRaised = false
            
            default:
                break
        }
    }
    
    func attachTrailer() {
        isTrailerAttached = true
    }
    
    func detachTrailer() {
        isTrailerAttached = false
    }
    
    func raiseMiddleWheel() {
        isMiddleWheelRaised = true
    }
    
    func downMiddleWheel() {
        isMiddleWheelRaised = false
    }
    
    func printParams() {
        print(description)
    }
}

var maz = TrunkCar(brand: "MAZ", model: "456", color: .blue, volume: 6.0, buildYear: 2000, trunkSize: 12.0, trunkSizeUsed: 6.0, isEngineStarted: false, isWindowOpened: true, isTrailerAttached: false, isMiddleWheelRaised: false)

var kamaz = TrunkCar(brand: "KAMAZ", model: "1102", color: .red, volume: 6.5, buildYear: 2005, trunkSize: 16.0, trunkSizeUsed: 5.0, isEngineStarted: false, isWindowOpened: false, isTrailerAttached: true, isMiddleWheelRaised: false)

var lada = SportCar(brand: "VAZ", model: "Kalina Sport", color: .yellow, volume: 2.0, buildYear: 2018, trunkSize: 0.5, trunkSizeUsed: 0.0, isEngineStarted: true, isWindowOpened: true, isRoofOpened: true, isNitroSwitchedOn: false)

var ferrari = SportCar(brand: "Ferrari", model: "Portofino", color: .magenta, volume: 5.0, buildYear: 2019, trunkSize: 0.3, trunkSizeUsed: 0.05, isEngineStarted: true, isWindowOpened: false, isRoofOpened: false, isNitroSwitchedOn: false)

maz.attachTrailer()
lada.closeRoof()
kamaz.raiseMiddleWheel()
ferrari.switchOnNitro()

maz.printParams()
lada.printParams()
kamaz.printParams()
ferrari.printParams()
