//
//  Expression.swift
//  Advent18
//
//  Created by Dragan Cecavac on 18.12.20.
//

import Foundation

class Expression {
    var operands = [String]()
    var operators = [Character]()

    init(_ input: String) {
        var level = 0
        var operand = ""

        for char in input {
            if char == " " {
                continue
            } else if char == "(" {
                level += 1
                if level == 1 {
                    continue
                }
            } else if char == ")" {
                level -= 1
                if level == 0 {
                    operands.append(operand)
                    operand = ""
                    continue
                }
            }

            if level == 0 {
                if char == "+" || char == "*" {
                    operators.append(char)
                } else {
                    operands.append("\(char)")
                }
            } else {
                operand += "\(char)"
            }
        }
    }

    func calculate() -> Int {
        if operators.count == 0 && operands.count == 1 {
            return Int(operands[0])!
        }

        var result = 0
        let val1 = Expression(operands[0]).calculate()
        let val2 = Expression(operands[1]).calculate()
        if operators[0] == "+" {
            result = val1 + val2
        } else if operators[0] == "*" {
            result = val1 * val2
        } else {
            print("Bad operator \(operators[0])")
        }

        for i in 1..<operators.count {
            if operators[i] == "+" {
                result += Expression(operands[i + 1]).calculate()
            } else if operators[i] == "*" {
                result *= Expression(operands[i + 1]).calculate()
            } else {
                print("Bad operator \(operators[i])")
            }
        }

        return result
    }
}
