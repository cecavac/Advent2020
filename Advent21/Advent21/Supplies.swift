//
//  Supplies.swift
//  Advent21
//
//  Created by Dragan Cecavac on 21.12.20.
//

import Foundation

class Supplies {
    var result1 = 0
    var result2 = ""

    var food = [Food]()
    var ingredients = Set<String>()
    var allergens = Set<String>()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let product = Food(String(line))
            food.append(product)

            for ingredient in product.ingredients {
                ingredients.insert(ingredient)
            }

            for allergen in product.allergens {
                allergens.insert(allergen)
            }
        }
    }

    func inspect() {
        var pairs = [(String, String)]()
        var mappedIngredients = Dictionary(uniqueKeysWithValues:zip(allergens, Array(repeating: ingredients, count: allergens.count)))

        for product in food {
            for allergen in product.allergens {
                mappedIngredients[allergen] = mappedIngredients[allergen]!.intersection(product.ingredients)
            }
        }

        // Narrow down
        for _ in allergens {
            for baseAllergen in allergens {
                if mappedIngredients[baseAllergen]!.count == 1 {
                    let candidateMatch = mappedIngredients[baseAllergen]!.first!

                    for allergen in allergens {
                        if allergen != baseAllergen {
                            mappedIngredients[allergen]!.remove(candidateMatch)
                        }
                    }
                }
            }
        }

        // Filter mapped ingredientes
        var safeIngredient = ingredients
        for allergen in allergens {
            let ingredient = mappedIngredients[allergen]!.first!

            safeIngredient.remove(ingredient)
            pairs.append((ingredient, allergen))
        }

        // Result 1
        for product in food {
            for ingredient in product.ingredients {
                if safeIngredient.contains(ingredient) {
                    result1 += 1
                }
            }
        }

        // Result 2
        pairs.sort { $0.1 < $1.1 }
        for i in pairs.indices {
            result2 += "\(pairs[i].0)"

            if i != pairs.count - 1 {
                result2 += ","
            }
        }
    }
}
