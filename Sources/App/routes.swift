import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Route to post games for a teams schedule
    router.post("api", String.parameter, "games") { req -> Future<Game> in
        let game = try req.content.syncDecode(Game.self)
        return game.save(on: req)
    }
    
    // Route to get all games for the give team
    router.get("api", String.parameter, "games") { req -> Future<[Game]> in
        return Game.query(on: req).all()
    }
    
    // Route to post a player for the given team
    router.post("api", String.parameter, "player") { req -> Future<Player> in
        let player = try req.content.syncDecode(Player.self)
        return player.save(on: req)
    }
    
    // Route to get all players on a teams 25 man roster
    router.get("api", String.parameter, "roster") { req -> Future<[Player]> in
        return Player.query(on: req).all()
    }
}
