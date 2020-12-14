//
//  Emulator.swift
//  Advent14
//
//  Created by Dragan Cecavac on 14.12.20.
//

import Foundation

class Emulator {
    var andMask: UInt64 = 0
    var orMask: UInt64 = 0
    var mem = [UInt64:UInt64]()

    func run(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let elements = line.split(separator: " ")
            if elements[0] == "mask" {
                andMask = 0
                orMask = 0

                for bit in elements[2] {
                    andMask <<= 1
                    orMask <<= 1

                    switch bit {
                    case "X":
                        andMask |= 1
                        orMask &= 0xFFFFFFFFE
                    case "0":
                        andMask &= 0xFFFFFFFFE
                        orMask &= 0xFFFFFFFFE
                    case "1":
                        andMask |= 1
                        orMask |= 1
                    default:
                        print("Wrong bit: \(bit)")
                    }
                }
            } else {
                var addrStr = elements[0].prefix(elements[0].count - 1)
                addrStr = addrStr.suffix(addrStr.count - 4)
                let addr = UInt64(addrStr)!
                let val = UInt64(String(elements[2]))!
                mem[addr] = (val & andMask) | orMask
            }
        }
    }

    var result: UInt64 {
        var ret: UInt64 = 0

        for (_, val) in mem {
            ret += val
        }

        return ret
    }
}
