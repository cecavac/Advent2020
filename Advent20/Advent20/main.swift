//
//  main.swift
//  Advent20
//
//  Created by Dragan Cecavac on 20.12.20.
//

import Foundation

let jigsaw = Jigsaw.init(Input.Input1)
jigsaw.solve()
jigsaw.examinePieces()
jigsaw.assembleImage()
jigsaw.lookForMonsters()

let result1 = jigsaw.result1!
print("Result1: \(result1)")

let result2 = jigsaw.result2!
print("Result2: \(result2)")
