//
//  Boarding.swift
//  Advent5
//
//  Created by Dragan Cecavac on 05.12.20.
//

import Foundation

class Boarding {
    var boardingIds = [Int]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            boardingIds.append(decode(boardingPass: String(line)))
        }

        boardingIds.sort() { $0 < $1 }
    }

    private func binSearch(input: String) -> Int {
        var result = 0

        for character in input {
            result *= 2
            if character == "B" || character == "R" {
                result += 1
            }
        }

        return result
    }

    private func decode(boardingPass data: String) -> Int {
        let row = binSearch(input: String(data.prefix(7)))
        let col = binSearch(input: String(data.suffix(3)))

        return row * 8 + col
    }

    var highestSeatId: Int? {
        return boardingIds.last
    }

    var freeSeat: Int? {
        for i in 0..<boardingIds.count - 1 {
            if boardingIds[i] + 2 == boardingIds[i + 1] {
                return boardingIds[i] + 1
            }
        }

        return nil
    }
}
