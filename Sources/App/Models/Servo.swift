//
//  Servo.swift
//  App
//
//  Created by ym on 2019/04/14.
//

import Foundation
import SwiftyGPIO

final class Servo {
    let pwms = SwiftyGPIO.hardwarePWMs(for: .RaspberryPiPlusZero)
    let pin: GPIOName = .P18
    var servo: PWMOutput!

    static let shared: Servo = Servo()

    private let periodNs: Int = 20_000_000
    private let duty: (on: Float, off: Float) = (3, 6)

    private init() {
        guard let servo = pwms?[0]?[pin] else {
            print("Can not found \(pin.rawValue) pin")
            exit(EXIT_FAILURE)
        }
        self.servo = servo
        cofigureServo()
    }

    deinit {
        servo.stopPWM()
    }

    func cofigureServo() {
        servo.initPWM()
    }

    func toggle() {
        print("Start servo")
        servo.startPWM(period: periodNs, duty: duty.on)
        sleep(1)
        servo.stopPWM()
        servo.startPWM(period: periodNs, duty: duty.off)
        sleep(1)
        servo.stopPWM()
        print("Stop servo")
    }
}
