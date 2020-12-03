//
//  Trajectory.swift
//  Advent3
//
//  Created by Dragan Cecavac on 03.12.20.
//

import Foundation

class Trajectory {
    var terrain = [[Character]]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            var row = [Character]()

            for character in line {
                row.append(character)
            }

            terrain.append(row)
        }
    }

    func treeCount(down stepI: Int, right stepJ: Int) -> Int {
        var treeCount = 0
        var j = 0

        for i in stride(from: stepI, to: terrain.count, by: stepI) {
            j += stepJ
            let wrappedJ = j % terrain[0].count
            if terrain[i][wrappedJ] == "#" {
                treeCount += 1
            }
        }

        return treeCount
    }

    func superTreeCount() -> Int {
        var superTreeCount = 1

        superTreeCount *= treeCount(down: 1, right: 1)
        superTreeCount *= treeCount(down: 1, right: 3)
        superTreeCount *= treeCount(down: 1, right: 5)
        superTreeCount *= treeCount(down: 1, right: 7)
        superTreeCount *= treeCount(down: 2, right: 1)

        return superTreeCount
    }
}
