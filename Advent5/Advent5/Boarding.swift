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

    private func binSearch(low: Int, high: Int, pattern: String) -> Int {
        var min = low
        var max = high

        for character in pattern {
            let mid = (max - min) / 2 + 1
            if character == "F" || character == "L" {
                max -= mid
            } else if character == "B" || character == "R" {
                min += mid
            } else {
                print("Error, unexpected character \(character)")
            }
        }

        // min and max are the same at this point
        return min
    }

    private func decode(boardingPass data: String) -> Int {
        let row = binSearch(low: 0, high: 127, pattern: String(data.prefix(7)))
        let col = binSearch(low: 0, high: 7, pattern: String(data.suffix(3)))

        return seatID(row: row, col: col)
    }

    private func seatID(row: Int, col: Int) -> Int {
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
