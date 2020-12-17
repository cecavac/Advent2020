//
//  HyperCubism.swift
//  Advent17
//
//  Created by Dragan Cecavac on 17.12.20.
//

import Foundation

class HyperCubism {
    var hypercubes = Set<String>()
    var oldHypercubes = Set<String>()

    func hash(i: Int, j: Int, k: Int, l: Int) -> String {
        return "\(i)#\(j)#\(k)#\(l)"
    }

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for i in lines.indices {
            let data = Array(String(lines[i]))
            for j in data.indices {
                let id = hash(i: i, j: j, k: 0, l: 0)
                if data[j] == "#" {
                    hypercubes.insert(id)
                }
            }
        }
    }

    func processHypercube(id: String) {
        var activeNeighbors = 0
        let elements = id.split(separator: "#")
        let x = Int(elements[0])!
        let y = Int(elements[1])!
        let z = Int(elements[2])!
        let w = Int(elements[3])!

        for i in x - 1...x + 1 {
            for j in y - 1...y + 1 {
                for k in z - 1...z + 1 {
                    for l in w - 1...w + 1 {
                        if i == x && j == y && k == z && l == w{
                            continue
                        }

                        let neighborId = hash(i: i, j: j, k: k, l: l)
                        if oldHypercubes.contains(neighborId) {
                            activeNeighbors += 1
                        }
                    }
                }
            }
        }

        if oldHypercubes.contains(id) {
            if activeNeighbors == 2 || activeNeighbors == 3 {
                hypercubes.insert(id)
            }
        } else {
            if activeNeighbors == 3 {
                hypercubes.insert(id)
            }
        }
    }

    func cycle() {
        oldHypercubes = hypercubes
        hypercubes.removeAll()

        var toProcess = Set<String>()
        for id in oldHypercubes {
            let elements = id.split(separator: "#")
            let x = Int(elements[0])!
            let y = Int(elements[1])!
            let z = Int(elements[2])!
            let w = Int(elements[3])!

            for i in x - 1...x + 1 {
                for j in y - 1...y + 1 {
                    for k in z - 1...z + 1 {
                        for l in w - 1...w + 1 {
                            let id = hash(i: i, j: j, k: k, l: l)
                            toProcess.insert(id)
                        }
                    }
                }
            }
        }

        for id in toProcess {
            processHypercube(id: id)
        }
    }

    func run(for cycles: Int) -> Int {
        for _ in 0..<cycles {
            cycle()
        }

        return hypercubes.count
    }
}
