//
//  ServoController.swift
//  App
//
//  Created by ym on 2019/04/14.
//

import Foundation
import Vapor

fileprivate struct ServoState: Codable {
    var state: Bool
}

final class ServoController {
    private var servoState: Bool = false

    private func createJSON(_ state: Bool) -> HTTPResponse {
        var response = HTTPResponse()
        response.body = HTTPBody(string: """
        {"state": \(state)}
        """)
        response.contentType = .json
        return response
    }

    func state(_ request: Request) throws -> Future<HTTPResponse> {
        return request.future(createJSON(servoState))
    }

    func toggle(_ request: Request) -> Future<HTTPStatus> {
        return request.future().map { [weak self] in
            Servo.shared.toggle()
            self?.servoState.toggle()
        }.transform(to: .ok)
    }
}
