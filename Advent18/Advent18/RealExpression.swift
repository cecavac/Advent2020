//
//  RealExpression.swift
//  Advent18
//
//  Created by Dragan Cecavac on 18.12.20.
//

import Foundation

class RealExpression : Expression {
    override func calculate() -> Int {
        if operators.count == 0 && operands.count == 1 {
            return Int(operands[0])!
        }

        var valOperands = [Int]()
        for operand in operands {
            valOperands.append(RealExpression(operand).calculate())
        }

        while valOperands.count > 1 {
            var index: Int! = nil

            if let i = operators.firstIndex(of: "+") {
                index = i
            } else if let i = operators.firstIndex(of: "*") {
                index = i
            } else {
                print("No valid operators")
            }

            let val2 = valOperands.remove(at: index! + 1)
            let val1 = valOperands.remove(at: index!)
            let op = operators.remove(at: index!)
            
            let val: Int
            if op == "+" {
                val = val1 + val2
            } else {
                val = val1 * val2
            }
            valOperands.insert(val, at: index!)
        }

        return valOperands[0]
    }
}
