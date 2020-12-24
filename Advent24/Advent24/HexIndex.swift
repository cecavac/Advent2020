//
//  HexIndex.swift
//  Advent24
//
//  Created by Dragan Cecavac on 24.12.20.
//

import Foundation

class HexIndex: Hashable {
    var i: Int
    var j: Int
    var z: Int

    static func == (lhs: HexIndex, rhs: HexIndex) -> Bool {
        return lhs.i == rhs.i && lhs.j == rhs.j && lhs.z == rhs.z
    }

    static func + (lhs: HexIndex, rhs: HexIndex) -> HexIndex {
        let i = lhs.i + rhs.i
        let j = lhs.j + rhs.j
        let z = (lhs.z + rhs.z) % 2

        return HexIndex(i, j, z)
    }

    static func += (lhs: HexIndex, rhs: HexIndex) {
        lhs.i += rhs.i
        lhs.j += rhs.j
        lhs.z = (lhs.z + rhs.z) % 2
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(i)
        hasher.combine(j)
        hasher.combine(z)
    }

    init(_ i: Int, _ j: Int, _ z: Int) {
        self.i = i
        self.j = j
        self.z = z
    }
}
