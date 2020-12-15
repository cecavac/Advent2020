//
//  main.swift
//  Advent15
//
//  Created by Dragan Cecavac on 15.12.20.
//

import Foundation

let result1 = NumbersGame.run(Input.Input1, turn: 2020)
print("Result1: \(result1)")

let result2 = NumbersGame.run(Input.Input1, turn: 30000000)
print("Result2: \(result2)")
