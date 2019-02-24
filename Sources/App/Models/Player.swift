//
//  Player.swift
//  App
//
//  Created by Ben Young on 2/22/19.
//

import Vapor
import FluentPostgreSQL

final class Player: Content {
    var id: UUID?
    
    var number: Int
    var firstName: String
    var lastName: String
    var team: String
    var position: String
    
    init(number: Int, firstName: String, lastName: String, team: String, position: String) {
        self.number = number
        self.firstName = firstName
        self.lastName = lastName
        self.team = team
        self.position = position
    }
}

extension Player: PostgreSQLUUIDModel {}
extension Player: Migration {}
