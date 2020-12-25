//
//  main.swift
//  Advent25
//
//  Created by Dragan Cecavac on 25.12.20.
//

import Foundation

let handshake = Handshake(key1: Input.Input11, key2: Input.Input12)
let result = handshake.crack()
print("Result: \(result)")
