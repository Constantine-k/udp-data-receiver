//
//  ViewController.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/7/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataReceiveManager = DataReceiveManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataReceiveManager.didReceiveDataAction = { data, _ in
            if let message = Message(jsonData: data) {
                print("Received message:\n-timestamp: \(message.timestamp)\n-text: \(message.text)")
            }
        }
        dataReceiveManager.beginReceiving()
    }

}
