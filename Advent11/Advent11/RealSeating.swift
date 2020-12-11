//
//  RealSeating.swift
//  Advent11
//
//  Created by Dragan Cecavac on 11.12.20.
//

import Foundation

class RealSeating : Seating {
    override var leaveSeatThreshold: Int {
        return 5
    }

    func neighborInSight(i: Int, j: Int, direction: Int) -> Int {
        var offsetI: Int? = nil
        var offsetJ: Int? = nil

        switch direction {
        case 0:
            offsetI = 0
            offsetJ = 1
        case 1:
            offsetI = 0
            offsetJ = -1
        case 2:
            offsetI = 1
            offsetJ = 0
        case 3:
            offsetI = -1
            offsetJ = 0
        case 4:
            offsetI = -1
            offsetJ = -1
        case 5:
            offsetI = 1
            offsetJ = 1
        case 6:
            offsetI = -1
            offsetJ = 1
        case 7:
            offsetI = 1
            offsetJ = -1
        default:
            print("Error direction: \(direction)")
        }

        var newI = i
        var newJ = j
        while true {
            newI += offsetI!
            newJ += offsetJ!

            if newI >= 0 && newI < lobby.count &&
                newJ >= 0 && newJ < lobby[0].count {
                if lobby[newI][newJ] == "L" {
                    return 0
                } else if lobby[newI][newJ] == "#" {
                    return 1
                }
            } else {
                return 0
            }
        }
    }

    override func occupiedNeighbors(i: Int, j: Int) -> Int {
        var occupiedNeigbors = 0

        for direction in 0..<8 {
            occupiedNeigbors += neighborInSight(i: i, j: j, direction: direction)
        }

        return occupiedNeigbors
    }
}
