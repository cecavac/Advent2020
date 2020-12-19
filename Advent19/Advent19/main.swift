//
//  main.swift
//  Advent19
//
//  Created by Dragan Cecavac on 19.12.20.
//

import Foundation

let validator1 = Validator(Input.Input1_rules)
let result1 = validator1.countMatching(in: Input.Input1_data)
print("Result1: \(result1)")

let validator2 = Validator(Input.Input2_rules)
let result2 = validator2.countMatching(in: Input.Input1_data)
print("Result2: \(result2)")
