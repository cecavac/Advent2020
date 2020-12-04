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
        return ecl != nil &&
            pid != nil &&
            eyr != nil &&
            hcl != nil &&
            byr != nil &&
            iyr != nil &&
            hgt != nil
    }

    var isFullyValid: Bool {
        if !isValid {
            return false
        }

        if let birthYear = Int(byr!) {
            if !(birthYear >= 1920 && birthYear <= 2002) {
                return false
            }
        } else {
            return false
        }

        if let issueYear = Int(iyr!) {
            if !(issueYear >= 2010 && issueYear <= 2020) {
                return false
            }
        } else {
            return false
        }

        if let expirationYear = Int(eyr!) {
            if !(expirationYear >= 2020 && expirationYear <= 2030) {
                return false
            }
        } else {
            return false
        }

        let heightUnit = hgt!.suffix(2)
        if let heightValue = Int(hgt!.prefix(hgt!.count - 2)) {
            switch heightUnit {
            case "cm":
                if !(heightValue >= 150 && heightValue <= 193) {
                    return false
                }
            case "in":
                if !(heightValue >= 59 && heightValue <= 76) {
                    return false
                }
            default:
                return false
            }
        } else {
            return false
        }

        if hcl!.count != 7 || hcl!.first! != "#" {
            return false
        } else {
            let intCheck = Int(hcl!.suffix(6), radix: 16)
            if intCheck == nil {
                return false
            }
        }

        switch ecl {
        case "amb":
            break
        case "blu":
            break
        case "brn":
            break
        case "gry":
            break
        case "grn":
            break
        case "hzl":
            break
        case "oth":
            break
        default:
            return false
        }

        if pid!.count != 9 {
            return false
        } else {
            let intCheck = Int(pid!)
            if intCheck == nil {
                return false
            }
        }

        return true
    }
}
