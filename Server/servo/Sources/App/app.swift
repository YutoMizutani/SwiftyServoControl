import Vapor

/// Creates an instance of `Application`. This is called from `main.swift` in the run target.
public func app(_ env: Environment) throws -> Application {
    let config = Config.default()
    let env = env
    let services = Services.default()
    let app = try Application(config: config, environment: env, services: services)
    try boot(app)
    return app
}
