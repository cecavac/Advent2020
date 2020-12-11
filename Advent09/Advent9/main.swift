//
//  main.swift
//  Advent9
//
//  Created by Dragan Cecavac on 08.12.20.
//

import Foundation

let xmas = Xmas(Input.Input1)

let result1 = xmas.firstInvalid()!
print("Result1: \(result1)")

let result2 = xmas.getWeakness(for: result1)!
print("Result2: \(result2)")
