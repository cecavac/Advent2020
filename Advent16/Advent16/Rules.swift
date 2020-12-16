//
//  Ticket.swift
//  Advent16
//
//  Created by Dragan Cecavac on 16.12.20.
//

import Foundation

class Rules {
    var fields = [(ClosedRange<Int>, ClosedRange<Int>, String)]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let initialElements = line.split(separator: ":")
            let elements = initialElements[1].split(separator: " ")
            let range1elements = elements[0].split(separator: "-")
            let range2elements = elements[2].split(separator: "-")
            let range1 = Int(String(range1elements[0]))!...Int(String(range1elements[1]))!
            let range2 = Int(String(range2elements[0]))!...Int(String(range2elements[1]))!
            fields.append((range1, range2, String(initialElements[0])))
        }
    }

    func validRate(ticket: [Int]) -> Int {
        var result = 0

        for element in ticket {
            var found = false
            for rule in fields {
                found = found || rule.0.contains(element)
                found = found || rule.1.contains(element)
                if found {
                    break
                }
            }
            if !found {
                result += element
            }
        }

        return result
    }

    func departureMultiplier(validTickets: [[Int]], ticket: [Int]) -> Int {
        let tickets = validTickets + [ticket]

        var ruleMap = [Int:Int]()
        var mapped = Set<Int>()
        while ruleMap.count != fields.count {
            for ruleIndex in fields.indices {
                var possibilities = [Int]()
                for column in ticket.indices {
                    if mapped.contains(column) {
                        continue
                    }

                    var valid = true
                    for i in tickets.indices {
                        valid = valid && (fields[ruleIndex].0.contains(tickets[i][column]) || fields[ruleIndex].1.contains(tickets[i][column]))
                        if !valid {
                            break
                        }
                    }
                    if valid {
                        possibilities.append(column)
                    }
                }
                if possibilities.count == 1 {
                    ruleMap[ruleIndex] = possibilities[0]
                    mapped.insert(possibilities[0])
                }
            }
        }

        var result = 1

        for ruleIndex in fields.indices {
            if fields[ruleIndex].2.starts(with: "departure") {
                if let index = ruleMap[ruleIndex] {
                    result *= ticket[index]
                }
            }
        }

        return result
    }
}
