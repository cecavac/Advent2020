//
//  Customs.swift
//  Advent6
//
//  Created by Dragan Cecavac on 06.12.20.
//

import Foundation

class Customs {
    var answers = 0
    var alignedAnswers = 0

    private func reformat(input: String) -> String {
        let data = Array(input)

        var parsableInput = ""
        for i in 0..<data.count - 1 {
            if data[i] == "\n" {
                parsableInput += "\n"
                if data[i + 1] == "\n" {
                    parsableInput += "#"
                }
            } else {
                parsableInput += "\(data[i])"
            }
        }

        return parsableInput + "\(data.last!)"
    }


    init(_ input: String) {
        let parsableInput = reformat(input: input)
        let groups = parsableInput.split(separator: "#")
        for group in groups {
            var set = Set<Character>()
            let people = group.split(separator: "\n")

            var matchingAnswers = [Character:Int]()
            for person in people {
                for character in person {
                    // Part 1
                    set.insert(character)

                    // Part 2
                    if let matchingCount = matchingAnswers[character] {
                        matchingAnswers[character] = matchingCount + 1
                    } else {
                        matchingAnswers[character] = 1
                    }
                }
            }
            // Part 1
            answers += set.count

            // Part 2
            for (_, count) in matchingAnswers {
                if count == people.count {
                    alignedAnswers += 1
                }
            }
        }
    }
}
