//
//  Handshake.swift
//  Advent25
//
//  Created by Dragan Cecavac on 25.12.20.
//

import Foundation

class Handshake {
    let key1: Int
    let key2: Int

    init(key1: Int, key2: Int) {
        self.key1 = key1
        self.key2 = key2
    }

    func crackLoop(key: Int) -> Int! {
        var value = 1
        let subjectNumber = 7

        for i in 1...Int.max {
            value *= subjectNumber
            value %= 20201227

            if value == key {
                return i
            }
        }

        return nil
    }

    func crack() -> Int {
        let loop1 = crackLoop(key: key1)!
        let subjectNumber = key2
        var value = 1

        for _ in 0..<loop1 {
            value *= subjectNumber
            value %= 20201227
        }

        return value
    }
}
