//
//  Validator.swift
//  Advent4
//
//  Created by Dragan Cecavac on 04.12.20.
//

import Foundation

class Validator {
    var passports = [Passport]()

    init(_ input: String) {
        let inputArray = Array(input)
        var passportInput = ""
        for index in inputArray.indices {
            if index == input.count - 1 {
                let passport = Passport("\(passportInput)\(inputArray[index])")
                passports.append(passport)
            } else if (inputArray[index] == "\n" && inputArray[index + 1] == "\n") {
                let passport = Passport(passportInput)
                passports.append(passport)

                passportInput = ""
            } else {
                passportInput += "\(inputArray[index])"
            }
        }
    }

    var validPassports: Int {
        return passports.filter { passport in return passport.isValid}.count
    }

    var fullyValidPassports: Int {
        return passports.filter { passport in return passport.isFullyValid}.count
    }
}
