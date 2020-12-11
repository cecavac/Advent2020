//
//  main.swift
//  Advent11
//
//  Created by Dragan Cecavac on 11.12.20.
//

import Foundation

let seating = Seating(Input.Input1)
let result1 = seating.run()
print("Result1: \(result1)")

let realSeating = RealSeating(Input.Input1)
let result2 = realSeating.run()
print("Result2: \(result2)")
