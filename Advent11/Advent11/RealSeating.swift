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
        let offsets = [[0, 1], [0, -1], [1, 0], [-1, 0], [-1, 1], [1, -1], [-1, -1], [1, 1]]
        let offsetI = offsets[direction][0]
        let offsetJ = offsets[direction][1]
        var newI = i + offsetI
        var newJ = j + offsetJ

        while let neighbor = lobby.grab(newI)?.grab(newJ) {
            if neighbor == "L" {
                return 0
            } else if neighbor == "#" {
                return 1
            }

            newI += offsetI
            newJ += offsetJ
        }

        return 0
    }

    override func occupiedNeighbors(i: Int, j: Int) -> Int {
        var occupiedNeigbors = 0

        for direction in 0..<8 {
            occupiedNeigbors += neighborInSight(i: i, j: j, direction: direction)
        }

        return occupiedNeigbors
    }
}
