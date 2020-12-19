//
//  Rule.swift
//  Advent19
//
//  Created by Dragan Cecavac on 19.12.20.
//

import Foundation

class Rule {
    static var cache = [Int:[String:Bool]]()

    public static func clearCache() {
        cache = [Int:[String:Bool]]()
    }

    var charRule: Character! = nil
    var pipeRules = [[Int]]()
    let id: Int

    init(_ input: String, id: Int) {
        self.id = id
        Rule.cache[id] = [String:Bool]()

        if input.contains("\"") {
            charRule = input.suffix(2).first!
        } else {
            let variations = input.split(separator: "|")
            for variation in variations {
                let elements = variation.split(separator: " ")
                var pipeRule = [Int]()
                for element in elements {
                    pipeRule.append(Int(String(element))!)
                }
                pipeRules.append(pipeRule)
            }
        }
    }

    func matches(data: String, rules: [Int:Rule]!) -> Bool {
        if let cachedResult = Rule.cache[id]![data] {
            return cachedResult
        }

        if charRule != nil {
            return data.count == 1 && charRule! == data.first!
        } else {
            for variations in pipeRules {
                if data.count < variations.count {
                    continue
                }

                if variations.count == 1 {
                    let result = rules[variations[0]]!.matches(data: data, rules: rules)
                    if result {
                        Rule.cache[id]![data] = true
                        return true
                    }
                } else if variations.count == 2 {
                    for i in 1..<data.count {
                        let data1 = String(data.prefix(i))
                        let data2 = String(data.suffix(data.count - i))
                        let result = rules[variations[0]]!.matches(data: data1, rules: rules) && rules[variations[1]]!.matches(data: data2, rules: rules)

                        if result {
                            Rule.cache[id]![data] = true
                            return true
                        }
                    }
                } else if variations.count == 3 { // for the example only
                    for i in 1...data.count - 2 {
                        let data1 = String(data.prefix(i))
                        let data23 = String(data.suffix(data.count - i))
                        for j in 1..<data23.count {
                            let data2 = String(data23.prefix(j))
                            let data3 = String(data23.suffix(data23.count - j))
                            let result = rules[variations[0]]!.matches(data: data1, rules: rules) &&
                                rules[variations[1]]!.matches(data: data2, rules: rules) &&
                                rules[variations[2]]!.matches(data: data3, rules: rules)
                            if result {
                                Rule.cache[id]![data] = true
                                return true
                            }
                        }
                    }
                } else {
                    print("Unsupported rule set")
                }
            }
        }

        Rule.cache[id]![data] = false
        return false
    }
}
