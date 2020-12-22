//
//  main.swift
//  Advent22
//
//  Created by Dragan Cecavac on 22.12.20.
//

import Foundation

let crabCombat = CrabCombat(Input.Input1)
crabCombat.play()
let result1 = crabCombat.score
print("Result1: \(result1)")

let recursiveCombat = RecursiveCombat(Input.Input1)
recursiveCombat.play()
let result2 = recursiveCombat.score
print("Result2: \(result2)")
