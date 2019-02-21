//
//  Game.swift
//  App
//
//  Created by Ben Young on 2/20/19.
//

import Vapor
import FluentSQLite

final class Game: Codable {
    var id: Int?
    var home: String
    var away: String
    var datetime: String
    var dayOfWeek: String
    
    init(home: String, away: String, datetime: String, dayOfWeek: String) {
        self.home = home
        self.away = away
        self.datetime = datetime
        self.dayOfWeek = dayOfWeek
    }
}

extension Game: SQLiteModel {}
extension Game: Content {}
extension Game: Migration {}
