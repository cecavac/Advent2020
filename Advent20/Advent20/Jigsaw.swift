//
//  Jigsaw.swift
//  Advent20
//
//  Created by Dragan Cecavac on 20.12.20.
//

import Foundation

class Jigsaw {
    private var positioned = [Tile]()
    private var remaining = [Tile]()

    private var monsterHeight: Int = 0
    private var monsterWidth: Int = 0
    private var monsterArray = [[Character]]()
    private let monster = """
                  #
#    ##    ##    ###
 #  #  #  #  #  #
"""

    private(set) var result1: Int! = nil
    private(set) var result2: Int? = nil

    private var horizontalPieces: Int = 0
    private var verticalPieces: Int = 0
    private var image: [[Character]]! = nil

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        var i = 0
        while i < lines.count {
            var tileInput = ""
            for _ in 0..<11 {
                tileInput += "\(lines[i])\n"
                i += 1
            }
            remaining.append(Tile(tileInput))
        }

        let monsterLines = monster.split(separator: "\n")
        monsterHeight = monsterLines.count
        for line in monsterLines {
            monsterArray.append(Array(String(line)))
            monsterWidth = max(monsterWidth, line.count)
        }
    }

    func solve() {
        let firstPiece = remaining.remove(at: 0)
        firstPiece.x = 1000
        firstPiece.y = 1000
        positioned.append(firstPiece)

        while remaining.count > 0 {
            tileLoop: for tile in positioned.reversed() {
                for i in remaining.indices {
                    for _ in 0..<2 {
                        for _ in 0..<4 {
                            let examinedTile = remaining[i]

                            if let position = tile.matching(tile: examinedTile) {
                                switch position {
                                case Tile.Side.Top:
                                    examinedTile.x = tile.x
                                    examinedTile.y = tile.y - 1
                                case Tile.Side.Right:
                                    examinedTile.x = tile.x + 1
                                    examinedTile.y = tile.y
                                case Tile.Side.Bottom:
                                    examinedTile.x = tile.x
                                    examinedTile.y = tile.y + 1
                                case Tile.Side.Left:
                                    examinedTile.x = tile.x - 1
                                    examinedTile.y = tile.y
                                }

                                remaining.remove(at: i)
                                positioned.append(examinedTile)

                                break tileLoop
                            }

                            remaining[i].rotate()
                        }
                        remaining[i].flip()
                    }
                }
            }
        }
    }

    func examinePieces() {
        var tlCorner = positioned.first!
        var blCorner = positioned.first!
        var trCorner = positioned.first!
        var brCorner = positioned.first!

        for tile in positioned {
            if tile.x <= tlCorner.x && tile.y <= tlCorner.y {
                tlCorner = tile
            }

            if tile.x <= blCorner.x && tile.y >= blCorner.y {
                blCorner = tile
            }

            if tile.x >= trCorner.x && tile.y <= trCorner.y {
                trCorner = tile
            }

            if tile.x >= brCorner.x && tile.y >= brCorner.y {
                brCorner = tile
            }
        }

        result1 = tlCorner.id * blCorner.id * trCorner.id * brCorner.id
        horizontalPieces = trCorner.x - tlCorner.x + 1
        verticalPieces = blCorner.y - tlCorner.y + 1

        // Move to the start of X/Y space.
        // So far the first piece was kept at (1000, 1000) and the others were placed relative to it.
        let currentXStart = tlCorner.x
        let currentYStart = tlCorner.y
        for i in positioned.indices {
            positioned[i].x -= currentXStart
            positioned[i].y -= currentYStart
        }

        positioned.sort { $0.positionHash < $1.positionHash }
    }

    func assembleImage() {
        image = Array(repeating: Array(repeating: "?", count: horizontalPieces * 8), count: verticalPieces * 8)
        for tile in positioned {
            let tileImage = tile.borderlessImage()
            for i in 0..<8 {
                for j in 0..<8 {
                    let imageI = tile.y * 8 + i
                    let imageJ = tile.x * 8 + j
                    image![imageI][imageJ] = tileImage[i][j]
                }
            }
        }
    }

    private func lookCarefully() {
        let monsterHeight = monsterArray.count
        let monsterWidth = monsterArray[0].count
        var foundAny = false


        for i in 0..<image!.count - (monsterHeight - 1) {
            for j in 0..<image![0].count - (monsterWidth - 1) {
                var found = true

                monsterLoop: for mi in 0..<monsterHeight {
                    for mj in 0..<monsterArray[mi].count {
                        if monsterArray[mi][mj] == "#" && image![i + mi][j + mj] != "#" {
                            found = false
                            break monsterLoop
                        }
                    }
                }

                if found {
                    foundAny = true
                    for mi in 0..<monsterHeight {
                        for mj in 0..<monsterArray[mi].count {
                            if monsterArray[mi][mj] == "#" {
                                image![i + mi][j + mj] = "O"
                            }
                        }
                    }
                }
            }
        }

        if foundAny {
            result2 = 0
            for row in image {
                result2! += row.filter { $0 == Character("#") }.count
            }
        }
    }

    func lookForMonsters() {
        for _ in 0..<2 {
            for _ in 0..<4 {
                lookCarefully()

                if result2 != nil {
                    return
                }

                image = Tile.rotate(image)
            }
            image = Tile.flip(image)
        }
    }
}
