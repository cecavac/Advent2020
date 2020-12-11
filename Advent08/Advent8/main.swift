//
//  main.swift
//  Advent8
//
//  Created by Dragan Cecavac on 07.12.20.
//

import Foundation

let console = Console(Input.Input1)

let result1 = console.run()
print("Result1: \(result1)")

let result2 = console.repairedRun()!
print("Result2: \(result2)")
