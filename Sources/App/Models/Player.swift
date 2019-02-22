//
//  Player.swift
//  App
//
//  Created by Ben Young on 2/22/19.
//

import Vapor
import FluentSQLite

final class Player: Codable {
    var id: Int?
    var number: Int
    var firstName: String
    var lastName: String
    var team: String
    
    init(number: Int, firstName: String, lastName: String, team: String) {
        self.number = number
        self.firstName = firstName
        self.lastName = lastName
        self.team = team
    }
}

extension Player: SQLiteModel {}
extension Player: Content {}
extension Player: Migration {}
