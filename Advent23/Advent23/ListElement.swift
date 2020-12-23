//
//  ListElement.swift
//  Advent23
//
//  Created by Dragan Cecavac on 23.12.20.
//

import Foundation

class ListElement: Equatable {
    static func == (lhs: ListElement, rhs: ListElement) -> Bool {
        lhs.val == rhs.val
    }

    var next: ListElement! = nil
    var prev: ListElement! = nil
    let val: Int

    init(_ val: Int) {
        self.val = val
    }
}
