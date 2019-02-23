//
//  Team.swift
//  App
//
//  Created by Ben Young on 2/23/19.
//

import Vapor
import FluentPostgreSQL

final class Team: Content {
    var id: UUID?
    
    var name: String
    var location: String
    var ballpark: String
    var league: String
    
    init(name: String, location: String, ballpark: String, league: String) {
        self.name = name
        self.location = location
        self.ballpark = ballpark
        self.league = league
    }
}

extension Team: PostgreSQLUUIDModel {}
extension Team: Migration {}
