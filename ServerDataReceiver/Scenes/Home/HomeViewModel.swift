//
//  HomeViewModel.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/15/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

protocol HomeView: class {}

class HomeViewModel {

    weak var view: HomeView?

    let dataReceiveManager = DataReceiveManager() // Set queue (!)

    convenience init(view: HomeView) {
        self.init()
        self.view = view
    }

    private init() {}

    func startReceivingMessages() {
        dataReceiveManager.didReceiveDataAction = { data, _ in
            if let message = Message(jsonData: data) {
                print("Received message:\n-timestamp: \(message.timestamp)\n-text: \(message.text)")
            }
        }
        dataReceiveManager.beginReceiving()
    }

}
