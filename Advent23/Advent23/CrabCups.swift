//
//  CrabCups.swift
//  Advent23
//
//  Created by Dragan Cecavac on 23.12.20.
//

import Foundation

class CrabCups {
    var current: ListElement! = nil
    var highest = 0
    var map = [Int:ListElement]()

    init(_ input: String, extend: Bool) {
        var head: ListElement! = nil
        var tail: ListElement! = nil

        for char in input {
            let cup = Int(String(char))!
            let element = ListElement(cup)
            map[cup] = element

            if head == nil {
                head = element
                tail = element
            } else {
                tail.next = element
                element.prev = tail
                tail = element
            }

            highest = max(highest, cup)
        }

        if extend {
            highest = 1000000

            for cup in input.count + 1...highest {
                let element = ListElement(cup)
                tail.next = element
                element.prev = tail
                tail = element

                map[cup] = element
            }
        }

        tail.next = head
        head.prev = tail
        current = head
    }

    func run(moves: Int) {
        for _ in 0..<moves {
            let movedHead = current.next!
            let movedTail = movedHead.next.next!

            current.next = movedTail.next
            movedTail.next.prev = current

            var desitnationVal = current.val - 1
            for _ in 0..<3 {
                if movedHead.val == desitnationVal ||
                        movedHead.next.val == desitnationVal ||
                        movedHead.next.next.val == desitnationVal {
                    desitnationVal -= 1
                }
            }
            if desitnationVal < 1 {
                desitnationVal = highest

                for _ in 0..<3 {
                    if movedHead.val == desitnationVal ||
                            movedHead.next.val == desitnationVal ||
                            movedHead.next.next.val == desitnationVal {
                        desitnationVal -= 1
                    }
                }
            }

            let destinationHead = map[desitnationVal]!
            let desitantionTail = destinationHead.next

            destinationHead.next = movedHead
            movedHead.prev = destinationHead

            desitantionTail!.prev = movedTail
            movedTail.next = desitantionTail

            current = current.next
        }
    }

    var result1: Int {
        var result = 0
        let cupOne = map[1]!
        var i = cupOne.next!

        while i != cupOne {
            result *= 10
            result += i.val
            i = i.next!
        }

        return result
    }

    var result2: Int {
        let cupOne = map[1]!

        return cupOne.next.val * cupOne.next.next.val
    }
}
