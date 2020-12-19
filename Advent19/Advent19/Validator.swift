//
//  Validator.swift
//  Advent19
//
//  Created by Dragan Cecavac on 19.12.20.
//

import Foundation

class Validator {
    var rules: [Int:Rule]! = [Int:Rule]()

    init(_ input: String) {
        Rule.clearCache()
        let lines = input.split(separator: "\n")
        for line in lines {
            let elements = line.split(separator: ":")
            let ruleId = Int(String(elements[0]))!
            let ruleInput = String(elements[1].suffix(elements[1].count - 1))
            let rule = Rule(ruleInput, id: ruleId)
            rules![ruleId] = rule
        }
    }

    func countMatching(in data: String) -> Int {
        var result = 0
        let mainRule = rules![0]!
        let lines = data.split(separator: "\n")
        for line in lines {
            if mainRule.matches(data: String(line), rules: rules) {
                result += 1
            }
        }

        return result
    }
}
