//
//  main.swift
//  Advent12
//
//  Created by Dragan Cecavac on 12.12.20.
//

import Foundation

let navigation = Navigation(Input.Input1)
let result1 = navigation.distance
print("Result1: \(result1)")

let realNavigation = RealNavigation(Input.Input1)
let result2 = realNavigation.distance
print("Result2: \(result2)")
