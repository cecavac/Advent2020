//
//  Tile.swift
//  Advent20
//
//  Created by Dragan Cecavac on 20.12.20.
//

import Foundation

class Tile {
    enum Side: Int {
        case Top
        case Right
        case Bottom
        case Left
    }

    let id: Int
    var x: Int = -1
    var y: Int = -1
    var orientation = Side.Top
    var rotations = [[[[Character]]]]()
    var flipIndex = 0
    var borders = [[[Int]]]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        let idInfo = lines[0].split(separator: " ")
        id = Int(String(idInfo[1].prefix(idInfo[1].count - 1)))!

        var baseArray = [[Character]]()
        for i in 1..<lines.count {
            var row = [Character]()
            for char in lines[i] {
                row.append(char)
            }
            baseArray.append(row)
        }

        var rotations0 = [[[Character]]]()
        rotations0.append(baseArray)
        rotations0.append(Tile.rotate(rotations0[Side.Top.rawValue]))
        rotations0.append(Tile.rotate(rotations0[Side.Right.rawValue]))
        rotations0.append(Tile.rotate(rotations0[Side.Bottom.rawValue]))
        rotations.append(rotations0)

        let newBaseArray = Tile.flip(baseArray)
        var rotations1 = [[[Character]]]()
        rotations1.append(newBaseArray)
        rotations1.append(Tile.rotate(rotations1[Side.Top.rawValue]))
        rotations1.append(Tile.rotate(rotations1[Side.Right.rawValue]))
        rotations1.append(Tile.rotate(rotations1[Side.Bottom.rawValue]))
        rotations.append(rotations1)

        hashBorders()
    }

    public static func rotate(_ base: [[Character]]) -> [[Character]]{
        let height = base.count
        let width = base[0].count
        var result = Array(repeating: Array(repeating: Character(" "), count: height), count: width)

        for i in 0..<height {
            for j in 0..<width {
                result[i][j] = base[j][height - 1 - i]
            }
        }

        return result
    }

    public static func flip(_ base: [[Character]]) -> [[Character]]{
        let height = base.count
        let width = base[0].count
        var result = Array(repeating: Array(repeating: Character(" "), count: width), count: height)

        for i in 0..<height {
            for j in 0..<width {
                result[i][j] = base[height - 1 - i][j]
            }
        }

        return result
    }

    func hashBorders() {
        for _ in 0..<2 {
            var flipBorders = [[Int]]()
            for _ in 0..<4 {
                var rotationBorders = [Int]()
                let base = data

                var topBorder = ""
                for j in 0..<10 {
                    topBorder += "\(base[0][j])"
                }
                rotationBorders.append(topBorder.hashValue)

                var rightBorder = ""
                for i in 0..<10 {
                    rightBorder += "\(base[i][9])"
                }
                rotationBorders.append(rightBorder.hashValue)

                var bottomBorder = ""
                for j in 0..<10 {
                    bottomBorder += "\(base[9][j])"
                }
                rotationBorders.append(bottomBorder.hashValue)

                var leftBorder = ""
                for i in 0..<10 {
                    leftBorder += "\(base[i][0])"
                }
                rotationBorders.append(leftBorder.hashValue)

                flipBorders.append(rotationBorders)
                rotate()
            }
            borders.append(flipBorders)
            flip()
        }
    }

    func rotate() {
        switch orientation {
        case Side.Top:
            orientation = Side.Right
        case Side.Right:
            orientation = Side.Bottom
        case Side.Bottom:
            orientation = Side.Left
        case Side.Left:
            orientation = Side.Top
        }
    }

    func flip() {
        flipIndex = (flipIndex + 1) % 2
    }

    var data: [[Character]] {
        return rotations[flipIndex][orientation.rawValue]
    }

    func matching(tile: Tile!) -> Side! {
        let baseBorders = borders[flipIndex][orientation.rawValue]
        let baseTop = baseBorders[Side.Top.rawValue]
        let baseRight = baseBorders[Side.Right.rawValue]
        let baseBottom = baseBorders[Side.Bottom.rawValue]
        let baseLeft = baseBorders[Side.Left.rawValue]

        let tileBorders = tile!.borders[tile!.flipIndex][tile!.orientation.rawValue]
        let tileTop = tileBorders[Side.Top.rawValue]
        let tileRight = tileBorders[Side.Right.rawValue]
        let tileBottom = tileBorders[Side.Bottom.rawValue]
        let tileLeft = tileBorders[Side.Left.rawValue]

        if baseTop == tileBottom {
            return Side.Top
        }

        if baseRight == tileLeft {
            return Side.Right
        }

        if baseBottom == tileTop {
            return Side.Bottom
        }

        if baseLeft == tileRight {
            return Side.Left
        }

        return nil
    }

    var positionHash: Int {
        return x + y * 1000
    }

    func borderlessImage() -> [[Character]] {
        let base = data
        var image = [[Character]]()

        for i in 1..<9 {
            var row = [Character]()
            for j in 1..<9 {
                row.append(base[i][j])
            }
            image.append(row)
        }

        return image
    }
}
