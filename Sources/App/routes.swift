import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.post("api", String.parameter, "games") { req -> Future<Game> in
        let game = try req.content.syncDecode(Game.self)
        return game.save(on: req)
    }
    
    // Get all games for the give team
    router.get("api", String.parameter, "games") { req -> Future<[Game]> in
        return Game.query(on: req).all()
    }
}
