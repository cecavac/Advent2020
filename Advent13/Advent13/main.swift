//
//  main.swift
//  Advent13
//
//  Created by Dragan Cecavac on 13.12.20.
//

import Foundation

let shuttle = Shuttle(Input.Input1)

let result1 = shuttle.firstBus()
print("Result1: \(result1)")

let result2 = shuttle.perfectTiming()
print("Result2: \(result2)")
