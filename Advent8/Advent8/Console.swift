//
//  Console.swift
//  Advent8
//
//  Created by Dragan Cecavac on 08.12.20.
//

import Foundation

class Console {
    var instructions = [String]()
    var ip = 0
    var acc = 0
    var executed = Set<Int>()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            instructions.append(String(line))
        }
    }

    private func coreRun() {
        let elements = instructions[ip].split(separator: " ")
        let op = elements[0]
        var valueSign = 0
        if elements[1].first! == "-" {
            valueSign = -1
        } else if elements[1].first! == "+"{
            valueSign = 1
        } else {
            print("Error, bad offset sign \(elements[1].first!)")
        }
        let absValue = Int(elements[1].suffix(elements[1].count - 1))!
        let value = valueSign * absValue

        switch op {
        case "acc":
            acc += value
            ip += 1
        case "jmp":
            ip += value
        case "nop":
            ip += 1
        default:
            print("Error, bad op \(op)")
        }
    }

    @discardableResult
    func run() -> Int {
        while ip >= 0 && ip < instructions.count {
            let oldAcc = acc
            executed.insert(ip)
            coreRun()
            if executed.contains(ip) {
                return oldAcc
            }
        }

        return acc
    }

    private func reset() {
        acc = 0
        ip = 0
        executed.removeAll()
    }

    func repairedRun() -> Int? {
        for i in instructions.indices {
            reset()
            let instructionsBackup = instructions
            let elements = instructions[i].split(separator: " ")
            let op = elements[0]

            switch op {
            case "acc":
                continue
            case "jmp":
                instructions[i] = "nop \(elements[1])"
            case "nop":
                instructions[i] = "jmp \(elements[1])"
            default:
                print("Error, bad op \(op)")
            }

            run()
            if ip == instructions.count {
                return acc
            }

            instructions = instructionsBackup
        }

        return nil
    }
}
