//
//  Passport.swift
//  Advent4
//
//  Created by Dragan Cecavac on 04.12.20.
//

import Foundation

class Passport {
    var ecl: String? = nil
    var pid: String? = nil
    var eyr: String? = nil
    var hcl: String? = nil
    var byr: String? = nil
    var iyr: String? = nil
    var cid: String? = nil
    var hgt: String? = nil

    init(_ input: String) {
        let lines = input.split(separator: "\n")
        var oneLineInput = ""
        for line in lines {
            oneLineInput += String(line) + " "
        }
        let elements = oneLineInput.split(separator: " ")
        for element in elements {
            let data = element.split(separator: ":")
            let value = String(data[1])
            switch String(data[0]) {
            case "ecl":
                ecl = value
            case "pid":
                pid = value
            case "eyr":
                eyr = value
            case "hcl":
                hcl = value
            case "byr":
                byr = value
            case "iyr":
                iyr = value
            case "cid":
                cid = value
            case "hgt":
                hgt = value
            default:
                print("Error, unknown tag \(data[0])")
            }
        }
    }

    var isValid: Bool {
        return ecl != nil && pid != nil && eyr != nil && hcl != nil && byr != nil && iyr != nil && hgt != nil
    }

    var isFullyValid: Bool {
        if !isValid {
            return false
        }

        var valid = true
        valid = valid && Int(byr!) != nil && Int(byr!)! >= 1920 && Int(byr!)! <= 2002
        valid = valid && Int(iyr!) != nil && Int(iyr!)! >= 2010 && Int(iyr!)! <= 2020
        valid = valid && Int(eyr!) != nil && Int(eyr!)! >= 2020 && Int(eyr!)! <= 2030
        let heightUnit = hgt!.suffix(2)
        let heightValue = Int(hgt!.prefix(hgt!.count - 2))
        valid = valid && heightValue != nil &&
            ((heightUnit == "cm" && heightValue! >= 150 && heightValue! <= 193) ||
            (heightUnit == "in" && heightValue! >= 59 && heightValue! <= 76))
        valid = valid && hcl!.count == 7 && hcl!.first! == "#"
        valid = valid && Int(hcl!.suffix(6), radix: 16) != nil
        valid = valid && ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(ecl!)
        valid = valid && pid!.count == 9
        valid = valid && Int(pid!) != nil

        return valid
    }
}
