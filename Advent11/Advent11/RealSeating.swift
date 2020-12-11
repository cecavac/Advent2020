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

    override func occupiedNeighbors(i: Int, j: Int) -> Int {
        var occupiedNeigbors = 0

        for offset in [[0, 1], [0, -1], [1, 0], [-1, 0], [-1, 1], [1, -1], [-1, -1], [1, 1]] {
            let offsetI = offset[0]
            let offsetJ = offset[1]
            var newI = i + offsetI
            var newJ = j + offsetJ

            while let neighbor = lobby.grab(newI)?.grab(newJ) {
                if neighbor == "L" {
                    break
                } else if neighbor == "#" {
                    occupiedNeigbors += 1
                    break
                }

                newI += offsetI
                newJ += offsetJ
            }
        }

        return occupiedNeigbors
    }
}
