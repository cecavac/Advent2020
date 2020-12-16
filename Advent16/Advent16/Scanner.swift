//
//  Tickets.swift
//  Advent16
//
//  Created by Dragan Cecavac on 16.12.20.
//

import Foundation

class Scanner {
    var rules: Rules
    var myTicket = [Int]()
    var otherTickets = [[Int]]()

    init(_ input: String) {
        let data = Array(input)
        var rulesInput = ""
        var index = 0

        for i in data.indices {
            if data[i] == "\n" && data[i + 1] == "\n" {
                index = i + 2
                break
            } else {
                rulesInput += "\(data[i])"
            }
        }
        rules = Rules(rulesInput)

        var myTicketInput = ""
        for i in index..<data.count - 1 {
            if data[i] == "\n" && data[i + 1] == "\n" {
                index = i + 2
                break
            } else {
                myTicketInput += "\(data[i])"
            }
        }
        let myTicketLines = myTicketInput.split(separator: "\n")
        let myTicketElements = myTicketLines[1].split(separator: ",")
        for element in myTicketElements {
            myTicket.append(Int(String(element))!)
        }

        var otherTicketsInput = ""
        for i in index..<data.count {
            otherTicketsInput += "\(data[i])"
        }
        let otherTicketsLines = otherTicketsInput.split(separator: "\n")
        for i in 1..<otherTicketsLines.count {
            let ticketElements = otherTicketsLines[i].split(separator: ",")
            var ticket = [Int]()
            for element in ticketElements {
                ticket.append(Int(String(element))!)
            }
            otherTickets.append(ticket)
        }
    }

    var validTickets = [[Int]]()
    func validRate() -> Int {
        var result = 0

        for ticket in otherTickets {
            let rate = rules.validRate(ticket: ticket)

            if rate == 0 {
                validTickets.append(ticket)
            } else {
                result += rate
            }
        }

        return result
    }

    func departureMultiplier() -> Int {
        return rules.departureMultiplier(validTickets: validTickets, ticket: myTicket)
    }
}
