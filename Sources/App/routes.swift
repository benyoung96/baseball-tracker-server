import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Route to post games for a teams schedule
    router.post(Game.self, at: "api", String.parameter, "schedule") { (request, game) in
        return game.save(on: request)
    }
    
    // Route to get all games for the give team
    router.get("api", String.parameter, "schedule") { req -> Future<[Game]> in
        return Game.query(on: req).all()
    }
    
    // Route to post a players for a team
    router.post(Player.self, at: "api", String.parameter, "player") { (request, player)  in
        return player.save(on: request)
    }
    
    // Route to get all players on a teams 25 man roster
    router.get("api", String.parameter, "roster") { req -> Future<[Player]> in
        return Player.query(on: req).all()
    }
    
    // Route to post teams of the mlb
    router.post(Team.self, at: "api", "teams") { (request, team) in
        return team.save(on: request)
    }
    
    // Route to get all teams
    router.get("api", "teams") { req -> Future<[Team]> in
        return Team.query(on: req).all()
    }
}
