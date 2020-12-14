//
//  main.swift
//  Advent14
//
//  Created by Dragan Cecavac on 13.12.20.
//

import Foundation

let emulator = Emulator()
emulator.run(Input.Input1)
let result1 = emulator.result
print("Result1: \(result1)")

let emulator2 = Emulator2()
emulator2.run(Input.Input1)
let result2 = emulator2.result
print("Result2: \(result2)")
