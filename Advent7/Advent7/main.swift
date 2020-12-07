//
//  main.swift
//  Advent7
//
//  Created by Dragan Cecavac on 07.12.20.
//

import Foundation

let luggage = Luggage(Input.Input1)

let result1 = luggage.fittable(bag: "shiny_gold")
print("Result1: \(result1)")

let result2 = luggage.subBags(bag: "shiny_gold")
print("Result2: \(result2)")
