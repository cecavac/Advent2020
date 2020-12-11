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
            result += (lobby[i].filter { $0 == "#" }).count
        }
        return result
    }

    func occupiedNeighbors(i: Int, j: Int) -> Int {
        var occupiedNeigbors = 0
        let offsets = [-1, 0, 1]
        for iOffset in offsets {
            for jOffset in offsets {
                let neighborI = i + iOffset
                let neighborJ = j + jOffset

                if neighborI == i && neighborJ == j {
                    continue
                } else {
                    if neighborI >= 0 && neighborI < lobby.count &&
                        neighborJ >= 0 && neighborJ < lobby[0].count &&
                        lobby[neighborI][neighborJ] == "#" {
                        occupiedNeigbors += 1
                    }
                }
            }
        }
        return occupiedNeigbors
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
