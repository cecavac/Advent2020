//
//  Bill.swift
//  Advent1
//
//  Created by Dragan Cecavac on 01.12.20.
//

import Foundation

class Bill {
    var data = [Int]()

    init(_ input: String) {
        let elements = input.split(separator: "\n")
        for element in elements {
            data.append(Int(String(element))!)
        }
    }

    func expenses() -> Int! {
        for i in data.indices {
            for j in i..<data.count {
                let sum = data[i] + data[j]
                if sum == 2020 {
                    return data[i] * data[j]
                }
            }
        }

        return nil
    }

    func tripplExpenses() -> Int! {
        for i in data.indices {
            for j in i..<data.count {
                let sum = data[i] + data[j]
                if sum < 2020 {
                    for z in j..<data.count {
                        let trippleSum = data[i] + data[j] + data[z]
                        if trippleSum == 2020 {
                            return data[i] * data[j] * data[z]
                        }
                    }
                }
            }
        }

        return nil
    }
}
