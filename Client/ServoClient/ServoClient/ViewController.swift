//
//  ViewController.swift
//  ServoClient
//
//  Created by ym on 2019/04/17.
//  Copyright © 2019 Yuto Mizutani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isConnecting = false

    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        let env = ProcessInfo.processInfo.environment
        let argv = ProcessInfo.processInfo.arguments
        let hostname = env["HOSTNAME"] ?? argv[1]
        let port = env["PORT"] ?? argv[2]
        let route = "/servo"
        let path = "http://\(hostname):\(port)\(route)"
        print("path: \(path)")

        url = URL(string: path)
    }

    private func post(_ completion: @escaping (() -> Void)) {
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let response = response {
                print(response)
            }
            completion()
        }.resume()
    }

    @IBAction private func tapAction() {
        guard !isConnecting else { return }
        isConnecting = true
        post { [weak self] in
            self?.isConnecting = false
        }
    }
}
