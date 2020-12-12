//
//  RealNavigation.swift
//  Advent12
//
//  Created by Dragan Cecavac on 12.12.20.
//

import Foundation

class RealNavigation {
    var waypointX = 10
    var waypointY = 1
    var x = 0
    var y = 0

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let char = line.first
            let valString = line.suffix(line.count - 1)
            let val = Int(valString)!

            switch char {
            case "E":
                waypointX += val
            case "W":
                waypointX -= val
            case "N":
                waypointY += val
            case "S":
                waypointY -= val
            case "F":
                x += waypointX * val
                y += waypointY * val
            case "L":
                for _ in 0..<val / 90 {
                    let oldWX = waypointX
                    let oldWY = waypointY
                    waypointX = -oldWY
                    waypointY = oldWX
                }
            case "R":
                for _ in 0..<val / 90 {
                    let oldWX = waypointX
                    let oldWY = waypointY
                    waypointX = oldWY
                    waypointY = -oldWX
                }
            default:
                print("Bad char: \(char!)")
            }
        }
    }

    var distance: Int {
        return abs(x) + abs(y)
    }
}
