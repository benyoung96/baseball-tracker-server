import FluentPostgreSQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers first
    try services.register(FluentPostgreSQLProvider())

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    // middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a Postgre database
    let config = PostgreSQLDatabaseConfig(hostname: "localhost", username: "ben", database: "baseball_tracker")

    // Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: PostgreSQLDatabase(config: config), as: .psql)
    services.register(databases)

    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Game.self, database: .psql)
    migrations.add(model: Player.self, database: .psql)
    migrations.add(model: Team.self, database: .psql)
    services.register(migrations)
}
