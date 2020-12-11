//
//  main.swift
//  Advent3
//
//  Created by Dragan Cecavac on 02.12.20.
//

import Foundation

let trajectory = Trajectory(Input.Input1)

let result1 = trajectory.treeCount(down: 1, right: 3)
print("Result1: \(result1)")

let result2 = trajectory.superTreeCount()
print("Result2: \(result2)")
