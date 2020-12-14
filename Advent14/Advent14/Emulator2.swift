//
//  Emulator2.swift
//  Advent14
//
//  Created by Dragan Cecavac on 14.12.20.
//

import Foundation

class Emulator2 : Emulator {
    var mask: String = ""

    override func run(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let elements = line.split(separator: " ")
            if elements[0] == "mask" {
                mask = String(elements[2])
            } else {
                let addr = UInt64(elements[0].prefix(elements[0].count - 1).suffix(elements[0].count - 5))!
                let val = UInt64(String(elements[2]))!
                var addresses = [addr]

                for j in 0..<mask.count {
                    let bitPosition = 35 - j

                    switch mask.prefix(j + 1).suffix(1) {
                    case "X":
                        var newAddresses = [UInt64]()
                        for address in addresses {
                            newAddresses.append(address & (~(1 << bitPosition)))
                            newAddresses.append(address | (1 << bitPosition))
                        }
                        addresses = newAddresses
                    case "0":
                        break
                    case "1":
                        for i in addresses.indices {
                            addresses[i] |= 1 << bitPosition
                        }
                    default:
                        print("Wrong bit number \(j) in: \(mask)")
                    }

                }

                for address in addresses {
                    mem[address] = val
                }
            }
        }
    }
}
