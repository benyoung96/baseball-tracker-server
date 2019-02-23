//
//  Game.swift
//  App
//
//  Created by Ben Young on 2/20/19.
//

import Vapor
import FluentPostgreSQL

final class Game: Content {
    var id: UUID?
    
    var home: String
    var away: String
    var datetime: String
    
    init(home: String, away: String, datetime: String) {
        self.home = home
        self.away = away
        self.datetime = datetime
    }
}

extension Game: PostgreSQLUUIDModel {}
extension Game: Migration {}
