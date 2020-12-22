//
//  RecursiveCpmbat.swift
//  Advent22
//
//  Created by Dragan Cecavac on 22.12.20.
//

import Foundation

class RecursiveCombat : CrabCombat {
    var history = Set<String>()

    override func play() {
        while deck1.count > 0 && deck2.count > 0 {
            let player1WinsRound: Bool
            let stateHash = "\(deck1)\(deck2)"

            if history.contains(stateHash) {
                break
            } else {
                history.insert(stateHash)
            }

            let card1 = deck1.remove(at: 0)
            let card2 = deck2.remove(at: 0)
            if card1 <= deck1.count && card2 <= deck2.count {
                let newDeck1 = Array(deck1.prefix(card1))
                let newDeck2 = Array(deck2.prefix(card2))
                let newCombat = RecursiveCombat(deck1: newDeck1, deck2: newDeck2)
                newCombat.play()
                player1WinsRound = newCombat.player1Won
            } else {
                player1WinsRound = card1 > card2
            }

            if player1WinsRound {
                deck1 += [card1, card2]
            } else {
                deck2 += [card2, card1]
            }
        }
    }
}

