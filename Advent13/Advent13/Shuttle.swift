//
//  Schedule.swift
//  Advent13
//
//  Created by Dragan Cecavac on 13.12.20.
//

import Foundation

class Shuttle {
    var start: Int
    var departures = [Int]()
    var grp = [(Int64, Int64)]()
    var originalData = Set<String>()

    init(_ input: String) {
        let lines = input.split(separator: "\n")

        start = Int(String(lines[0]))!
        let elements = lines[1].split(separator: ",")
        for i in 0..<elements.count {
            if let departure = Int(String(elements[i])) {
                departures.append(departure)
                grp.append((Int64(departure), Int64(i)))
            }
        }
    }

    func firstBus() -> Int {
        var result = Int.max
        var bestId = -1
        for departure in departures {
            let time = (departure - (start % departure)) % departure
            if time < result {
                result = time
                bestId = departure
            }
        }

        return result * bestId
    }

    func gcd(_ a: Int64, _ b: Int64) -> Int64 {
        let remainder = a % b
        if remainder != 0 {
            return gcd(b, remainder)
        } else {
            return b
        }
    }

    func lcm(_ a: Int64, _ b: Int64) -> Int64 {
        return (a / gcd(a, b)) * b
    }

    func perfectTiming() -> Int64 {
        while grp.count > 1 {
            let element1 = grp.removeFirst()
            let id1 = element1.0
            let offset1 = element1.1
            let element2 = grp.removeFirst()
            let id2 = element2.0
            let offset2 = element2.1

            var time = min(id1 - offset1, id2 - offset2)
            let increment: Int64 = min(id1, id2)

            while (time + offset1) % id1 != 0 || (time + offset2) % id2 != 0 {
                time += increment
            }

            let newId = lcm(id1, id2)
            grp.append((newId, newId - time))
        }

        return grp[0].0 - grp[0].1
    }
}
