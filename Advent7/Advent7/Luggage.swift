//
//  Luggage.swift
//  Advent7
//
//  Created by Dragan Cecavac on 07.12.20.
//

import Foundation

class Luggage {
    struct Bag {
        let name: String
        let contents: [(Int, String)]
    }

    var bags = [Bag]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let elements = line.split(separator: " ")
            let name = "\(elements[0])_\(elements[1])"
            var contents = [(Int, String)]()
            for i in 2..<elements.count - 1 {
                if let number = Int(String(elements[i])) {
                    let contentName = "\(elements[i + 1])_\(elements[i + 2])"
                    contents.append((number, contentName))
                }
            }
            bags.append(Bag(name: name, contents: contents))
        }
    }

    func fittable(bag target: String) -> Int {
        var validBags = Set<String>()

        for bag in bags {
            for subBag in bag.contents {
                if subBag.1 == target {
                    validBags.insert(bag.name)
                }
            }
        }

        var oldSetSize: Int
        repeat {
            oldSetSize = validBags.count
            for validBag in validBags {
                for otherBag in bags {
                    if validBags.contains(otherBag.name) {
                        continue
                    }

                    for subBag in otherBag.contents {
                        if subBag.1 == validBag {
                            validBags.insert(otherBag.name)
                        }
                    }
                }
            }
        } while oldSetSize < validBags.count

        return validBags.count
    }

    func subBags(bag target: String) -> Int {
        return subBagsInternal(bag: target) - 1
    }

    private func subBagsInternal(bag target: String) -> Int {
        var result = 0
        var targetBag: Bag! = nil
        for bag in bags {
            if bag.name == target {
                targetBag = bag
                break
            }
        }

        if targetBag.contents.count == 0 {
            return 1
        } else {
            for subBag in targetBag!.contents {
                result += subBag.0 * subBagsInternal(bag: subBag.1)
            }

            return result + 1
        }
    }
}
