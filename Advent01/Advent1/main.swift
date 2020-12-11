//
//  main.swift
//  Advent1
//
//  Created by Dragan Cecavac on 30.11.20.
//

import Foundation

let bill = Bill(Input.Input1)

let result1 = bill.expenses()!
print("Result1: \(result1)")

let result2 = bill.tripplExpenses()!
print("Result2: \(result2)")
