//
//  CrabCombat.swift
//  Advent22
//
//  Created by Dragan Cecavac on 22.12.20.
//

import Foundation

class CrabCombat {
    var deck1 = [Int]()
    var deck2 = [Int]()

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        let half = lines.count / 2
        for i in 1..<half {
            deck1.append(Int(String(lines[i]))!)
        }
        for i in half + 1..<lines.count {
            deck2.append(Int(String(lines[i]))!)
        }
    }

    init(deck1: [Int], deck2: [Int]) {
        self.deck1 = deck1
        self.deck2 = deck2
    }

    func play() {
        while deck1.count > 0 && deck2.count > 0 {
            let card1 = deck1.remove(at: 0)
            let card2 = deck2.remove(at: 0)

            if card1 > card2 {
                deck1 += [card1, card2]
            } else {
                deck2 += [card2, card1]
            }
        }
    }

    var player1Won: Bool {
        return deck1.count > 0
    }

    var score: Int {
        var result = 0
        let winnerDeck: [Int]

        if player1Won {
            winnerDeck = deck1
        } else {
            winnerDeck = deck2
        }

        for i in winnerDeck.indices {
            result += winnerDeck[i] * (winnerDeck.count - i)
        }

        return result
    }
}
