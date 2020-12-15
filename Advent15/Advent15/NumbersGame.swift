//
//  NumbersGame.swift
//  Advent15
//
//  Created by Dragan Cecavac on 15.12.20.
//

import Foundation

class NumbersGame {
    static func run(_ input: String, turn end:Int) -> Int{
        var map = [Int:Int]()
        let elements = input.split(separator: ",")
        for i in elements.indices {
            map[Int(String(elements[i]))!] = i
        }

        var lastDiff = 0
        for i in elements.count..<end - 1 {
            let newElement = lastDiff

            if let lastOccurrence = map[newElement] {
                lastDiff = i - lastOccurrence
            } else {
                lastDiff = 0
            }

            map[newElement] = i
        }
        return lastDiff
    }
}
