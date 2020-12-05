//
//  main.swift
//  Advent5
//
//  Created by Dragan Cecavac on 05.12.20.
//

import Foundation

let boarding = Boarding(Input.Input1)

let result1 = boarding.highestSeatId!
print("Result1: \(result1)")

let result2 = boarding.freeSeat!
print("Result2: \(result2)")
