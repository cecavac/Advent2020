//
//  main.swift
//  Advent10
//
//  Created by Dragan Cecavac on 10.12.20.
//

import Foundation

let charging = Charging(Input.Input1)

let result1 = charging.joltDiff()
print("Result1: \(result1)")

let result2 = charging.combinations()
print("Result2: \(result2)")
