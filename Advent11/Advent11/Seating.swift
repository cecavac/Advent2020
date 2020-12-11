//
//  Seating.swift
//  Advent11
//
//  Created by Dragan Cecavac on 11.12.20.
//

import Foundation

class Seating {
    var lobby = [[Character]]()
    var leaveSeatThreshold: Int {
        return 4
    }

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            let row = Array(line)
            lobby.append(row)
        }
    }

    var occupied: Int {
        var result = 0

        for i in lobby.indices {
            result += lobby[i].filter { $0 == "#" }.count
        }

        return result
    }

    func occupiedNeighbors(i: Int, j: Int) -> Int {
        var neighbours = [Character]()

        for neighborI in i - 1...i + 1 {
            for neighborJ in j - 1...j + 1 {
                if neighborI != i || neighborJ != j {
                    if let neighbor = lobby.grab(neighborI)?.grab(neighborJ) {
                        neighbours.append(neighbor)
                    }
                }
            }
        }

        return neighbours.filter { $0 == "#" }.count
    }

    func run() -> Int {
        var newState = "\(lobby)"
        var lastState: String

        repeat {
            lastState = newState
            var newLobby = lobby

            for i in lobby.indices {
                for j in lobby[0].indices {
                    let occupiedNeigbors = occupiedNeighbors(i: i, j: j)

                    switch lobby[i][j] {
                    case ".":
                        break
                    case "#":
                        if occupiedNeigbors >= leaveSeatThreshold {
                            newLobby[i][j] = "L"
                        }
                    case "L":
                        if occupiedNeigbors == 0 {
                            newLobby[i][j] = "#"
                        }
                    default:
                        print("Error element: \(lobby[i][j])")
                    }
                }
            }

            lobby = newLobby
            newState = "\(lobby)"
        } while newState != lastState

        return occupied
    }
}

extension Array {
   public func grab(_ i: Int) -> Element? {
     return (i >= 0 && i < count) ? self[i] : nil
   }
}
