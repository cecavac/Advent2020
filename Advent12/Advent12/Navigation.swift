//
//  Navigation.swift
//  Advent12
//
//  Created by Dragan Cecavac on 12.12.20.
//

import Foundation

class Navigation {
    var direction = "E"
    var x = 0
    var y = 0

    func move(direction: String, val: Int) {
        switch direction {
        case "E":
            x += val
        case "W":
            x -= val
        case "N":
            y += val
        case "S":
            y -= val
        default:
            print("Unsupported direction: \(direction)")
        }
    }

    func steer(instruction: String, degrees: Int) {
        var step: Int? = nil

        switch instruction {
        case "L":
            step = -degrees / 90
        case "R":
            step = degrees / 90
        default:
            print("Invalid instruction: \(instruction)")
        }

        let options = ["N", "E", "S", "W"]
        let index = options.firstIndex(of: direction)
        let newIndex = (options.count + index! + step!) % options.count
        direction = options[newIndex]
    }

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let dir = line.first
            let valString = line.suffix(line.count - 1)
            let val = Int(valString)!

            switch dir {
            case "F":
                move(direction: direction, val: val)
            case "R":
                steer(instruction: String(dir!), degrees: val)
            case "L":
                steer(instruction: String(dir!), degrees: val)
            default:
                move(direction: String(dir!), val: val)
            }
        }
    }

    var distance: Int {
        return abs(x) + abs(y)
    }
}
