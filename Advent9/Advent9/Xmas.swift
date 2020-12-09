//
//  Xmas.swift
//  Advent9
//
//  Created by Dragan Cecavac on 09.12.20.
//

import Foundation

class Xmas {
    var inputBuffer = [Int]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            inputBuffer.append(Int(line)!)
        }
    }

    private func isValid(preamble: [Int], newElement: Int) -> Bool {
        for j in 0..<preamble.count {
            for z in j + 1..<preamble.count {
                if newElement == preamble[j] + preamble[z] {
                    return true
                }
            }
        }

        return false
    }

    func firstInvalid() -> Int? {
        var preamble = [Int]()
        for i in 0..<25 {
            preamble.append(inputBuffer[i])
        }

        for i in 25..<inputBuffer.count {
            if isValid(preamble: preamble, newElement: inputBuffer[i]) {
                preamble.append(inputBuffer[i])
                preamble.remove(at: 0)
            } else {
                return inputBuffer[i]
            }
        }

        return nil
    }

    func getWeakness(for target: Int) -> Int? {
        for i in 0..<inputBuffer.count {
            var sum = inputBuffer[i]
            var minimum = inputBuffer[i]
            var maximum = inputBuffer[i]
            var j = i + 1

            while sum < target && j < inputBuffer.count {
                sum += inputBuffer[j]
                minimum = min(minimum, inputBuffer[j])
                maximum = max(maximum, inputBuffer[j])
                j += 1
            }

            if sum == target {
                return minimum + maximum
            }
        }

        return nil
    }
}
