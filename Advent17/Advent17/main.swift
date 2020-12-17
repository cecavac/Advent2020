//
//  main.swift
//  Advent17
//
//  Created by Dragan Cecavac on 17.12.20.
//

import Foundation

let cubism = Cubism(Input.Input1)
let result1 = cubism.run(for: 6)
print("Result1: \(result1)")

let hypercubism = HyperCubism(Input.Input1)
let result2 = hypercubism.run(for: 6)
print("Result2: \(result2)")
