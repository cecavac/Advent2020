//
//  Food.swift
//  Advent21
//
//  Created by Dragan Cecavac on 21.12.20.
//

import Foundation

class Food {
    var ingredients = Set<String>()
    var allergens = Set<String>()

    init(_ input: String) {
        var cleanInput = ""
        for char in input {
            if char != "," && char != ")" {
                cleanInput += "\(char)"
            }
        }

        let data = cleanInput.split(separator: "(")
        let ingredientData = data[0].split(separator: " ")
        for i in ingredientData.indices {
            ingredients.insert(String(ingredientData[i]))
        }

        let allergenData = data[1].split(separator: " ")
        for i in 1..<allergenData.count {
            allergens.insert(String(allergenData[i]))
        }
    }
}
