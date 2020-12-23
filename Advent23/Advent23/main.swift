//
//  main.swift
//  Advent23
//
//  Created by Dragan Cecavac on 23.12.20.
//

import Foundation

let crabCups1 = CrabCups(Input.Input1, extend: false)
crabCups1.run(moves: 100)
let result1 = crabCups1.result1
print("Result1: \(result1)")

let crabCups2 = CrabCups(Input.Input1, extend: true)
crabCups2.run(moves: 10000000)
let result2 = crabCups2.result2
print("Result2: \(result2)")
