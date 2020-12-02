//
//  Validator.swift
//  Advent2
//
//  Created by Dragan Cecavac on 02.12.20.
//

import Foundation

class Validator {
    struct PasswordData {
        let min: Int
        let max: Int
        let key: Character
        let password: String
    }

    var result1 = 0
    var result2 = 0

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let passwordData = parse(password: String(line))

            if isValid(passwordData) {
                result1 += 1
            }

            if isTobogganValid(passwordData) {
                result2 += 1
            }
        }
    }

    func parse(password input: String) -> PasswordData {
        let elements = input.split(separator: " ")
        let minMaxElements = elements[0].split(separator: "-")

        let min = Int(String(minMaxElements[0]))!
        let max = Int(String(minMaxElements[1]))!
        let key = elements[1].first!
        let password = String(elements[2])

        return PasswordData(min: min, max: max, key: key, password: password)
    }

    func isValid(_ data: PasswordData) -> Bool {
        var keyCount = 0

        for character in data.password {
            if character == data.key {
                keyCount += 1
            }
        }

        return keyCount >= data.min && keyCount <= data.max
    }

    func isTobogganValid(_ data: PasswordData) -> Bool {
        let password = Array(data.password)
        let firstCharIndex = data.min - 1
        let secondCharIndex = data.max - 1
        var firstCharMatching = false
        var secondCharMatching = false

        if firstCharIndex < password.count {
            firstCharMatching = password[firstCharIndex] == data.key
        }
        if secondCharIndex < password.count {
            secondCharMatching = password[secondCharIndex] == data.key
        }

        return firstCharMatching != secondCharMatching
    }
}
