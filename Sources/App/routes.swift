import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let servoController = ServoController()
    router.get("servo", use: servoController.state)
    router.post("servo", use: servoController.toggle)
}
