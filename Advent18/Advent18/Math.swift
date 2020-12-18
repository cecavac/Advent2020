//
//  Math.swift
//  Advent18
//
//  Created by Dragan Cecavac on 18.12.20.
//

import Foundation

class Math {
    public static func calculate(_ input: String) -> Int {
        var result = 0
        let lines = input.split(separator: "\n")

        for line in lines {
            result += Expression(String(line)).calculate()
        }

        return result
    }

    public static func realCalculate(_ input: String) -> Int {
        var result = 0
        let lines = input.split(separator: "\n")

        for line in lines {
            result += RealExpression(String(line)).calculate()
        }

        return result
    }
}
