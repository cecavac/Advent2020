//
//  main.swift
//  Advent4
//
//  Created by Dragan Cecavac on 04.12.20.
//

import Foundation

let validator = Validator(Input.Input1)

let result1 = validator.validPassports
print("Result1: \(result1)")

let result2 = validator.fullyValidPassports
print("Result2: \(result2)")
