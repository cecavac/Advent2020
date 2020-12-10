//
//  Charging.swift
//  Advent10
//
//  Created by Dragan Cecavac on 10.12.20.
//

import Foundation

class Charging {
    var adapters = [Int]()
    var cache = [Int:Int]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")

        var maxJolts = Int.min
        for line in lines {
            let jolts = Int(line)!
            maxJolts = max(maxJolts, jolts)
            adapters.append(jolts)
        }

        adapters.append(0)
        adapters.append(maxJolts + 3)

        adapters.sort() { $0 < $1 }
    }

    func joltDiff() -> Int {
        var oneJoltsDiffs = 0
        var threeJoltsDiffs = 0

        for i in 0..<adapters.count - 1 {
            let diff = adapters[i + 1] - adapters[i]
            if diff == 1 {
                oneJoltsDiffs += 1
            } else if diff == 3 {
                threeJoltsDiffs += 1
            }
        }

        return oneJoltsDiffs * threeJoltsDiffs
    }

    private func combinationsCore(lastUsed: Int) -> Int {
        if lastUsed == adapters.count - 1 {
            return 1
        }

        var result = 0
        var possibilities = [Int]()
        for i in lastUsed..<adapters.count {
            let diff = adapters[i] - adapters[lastUsed]
            if diff > 0 && diff <= 3 {
                possibilities.append(i)
            }
        }

        for possibility in possibilities {
            if let cachedResult = cache[possibility] {
                result += cachedResult
            } else {
                let combinations = combinationsCore(lastUsed: possibility)
                cache[possibility] = combinations
                result += combinations
            }
        }

        return result
    }

    func combinations() -> Int {
        return combinationsCore(lastUsed: 0)
    }
}
