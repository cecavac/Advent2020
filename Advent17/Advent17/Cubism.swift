//
//  Cubism.swift
//  Advent17
//
//  Created by Dragan Cecavac on 17.12.20.
//

import Foundation

class Cubism {
    var cubes = Set<String>()
    var oldCubes = Set<String>()

    func hash(i: Int, j: Int, k: Int) -> String {
        return "\(i)#\(j)#\(k)"
    }

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for i in lines.indices {
            let data = Array(String(lines[i]))
            for j in data.indices {
                let id = hash(i: i, j: j, k: 0)
                if data[j] == "#" {
                    cubes.insert(id)
                }
            }
        }
    }

    func processCube(id: String) {
        var activeNeighbors = 0
        let elements = id.split(separator: "#")
        let x = Int(elements[0])!
        let y = Int(elements[1])!
        let z = Int(elements[2])!

        for i in x - 1...x + 1 {
            for j in y - 1...y + 1 {
                for k in z - 1...z + 1 {
                    if i == x && j == y && k == z {
                        continue
                    }

                    let neighborId = hash(i: i, j: j, k: k)
                    if oldCubes.contains(neighborId) {
                        activeNeighbors += 1
                    }
                }
            }
        }

        if oldCubes.contains(id) {
            if activeNeighbors == 2 || activeNeighbors == 3 {
                cubes.insert(id)
            }
        } else {
            if activeNeighbors == 3 {
                cubes.insert(id)
            }
        }
    }

    func cycle() {
        oldCubes = cubes
        cubes.removeAll()

        var toProcess = Set<String>()
        for id in oldCubes {
            let elements = id.split(separator: "#")
            let x = Int(elements[0])!
            let y = Int(elements[1])!
            let z = Int(elements[2])!

            for i in x - 1...x + 1 {
                for j in y - 1...y + 1 {
                    for k in z - 1...z + 1 {
                        let id = hash(i: i, j: j, k: k)
                        toProcess.insert(id)
                    }
                }
            }
        }

        for id in toProcess {
            processCube(id: id)
        }
    }

    func run(for cycles: Int) -> Int {
        for _ in 0..<cycles {
            cycle()
        }

        return cubes.count
    }
}
