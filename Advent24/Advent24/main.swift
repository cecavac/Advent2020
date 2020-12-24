//
//  main.swift
//  Advent24
//
//  Created by Dragan Cecavac on 24.12.20.
//

import Foundation

let tiles = Tiles(Input.Input1)
let result1 = tiles.result
print("Result1: \(result1)")

tiles.change()
let result2 = tiles.result
print("Result2: \(result2)")
