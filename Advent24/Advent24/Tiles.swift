//
//  Tiles.swift
//  Advent24
//
//  Created by Dragan Cecavac on 24.12.20.
//

import Foundation

class Tiles {
    /*
     Initially I modeled tiles as 2 hash sets, where z was selecting the proper set.
     Each set represented an (i, j) matrix, and combined they represented my Hex matrix.
     Gradually it evolved into HexIndex, but the principle remains the same.
    */
    var blackTiles = Set<HexIndex>()

    let neighborOffsets = [
        [
            "e" : HexIndex(0, 1, 0),
            "w" : HexIndex(0, -1, 0),
            "ne" : HexIndex(0, 0, 1),
            "nw" : HexIndex(0, -1, 1),
            "se" : HexIndex(1, 0, 1),
            "sw" : HexIndex(1, -1, 1)
        ],
        [
            "e" : HexIndex(0, 1, 0),
            "w" : HexIndex(0, -1, 0),
            "ne" : HexIndex(-1, 1, 1),
            "nw" : HexIndex(-1, 0, 1),
            "se" : HexIndex(0, 1, 1),
            "sw" : HexIndex(0, 0, 1)
        ]
    ]

    func flip(index: HexIndex) {
        if blackTiles.contains(index) {
            blackTiles.remove(index)
        } else {
            blackTiles.insert(index)
        }
    }

    func parse(input: String) {
        let index = HexIndex(0, 0, 0)

        var prev: Character! = nil
        for char in input {
            if char != "e" && char != "w" {
                prev = char
            } else {
                var instruction = "\(char)"

                if prev != nil {
                    instruction = "\(prev!)\(instruction)"
                    prev = nil
                }

                let offset = neighborOffsets[index.z][instruction]!
                index += offset
            }
        }

        flip(index: index)
    }

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        for line in lines {
            parse(input: String(line))
        }
    }

    var result: Int {
        return blackTiles.count
    }

    func change() {
        for _ in 0..<100 {
            let originalBlackTiles = blackTiles
            var whiteTiles = Set<HexIndex>()

            // Consider all surrounding tiles white
            for index in originalBlackTiles {
                for (_, offset) in neighborOffsets[index.z] {
                    whiteTiles.insert(index + offset)
                }
            }

            // Remove any black tile listed as white tiles
            for index in originalBlackTiles {
                whiteTiles.remove(index)
            }

            // Process black tiles
            for index in originalBlackTiles {
                var neighbors = 0

                for (_, offset) in neighborOffsets[index.z] {
                    if originalBlackTiles.contains(index + offset) {
                        neighbors += 1
                    }
                }

                if neighbors == 0 || neighbors > 2 {
                    flip(index: index)
                }
            }

            // Process white tiles
            for index in whiteTiles {
                var neighbors = 0

                for (_, offset) in neighborOffsets[index.z] {
                    if originalBlackTiles.contains(index + offset) {
                        neighbors += 1
                    }
                }

                if neighbors == 2 {
                    flip(index: index)
                }
            }
        }
    }
}
