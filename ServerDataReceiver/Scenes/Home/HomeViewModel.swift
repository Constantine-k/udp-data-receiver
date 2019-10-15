//
//  HomeViewModel.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/15/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

protocol HomeView: class {
    func reloadData()
}

class HomeViewModel {

    weak var view: HomeView?

    let dataReceiveManager = DataReceiveManager() // Set queue (!)

    var messages = [Message]()

    convenience init(view: HomeView) {
        self.init()
        self.view = view
    }

    private init() {}

    func startReceivingMessages() {
        dataReceiveManager.didReceiveDataAction = { [weak self] data, _ in
            if let message = Message(jsonData: data) {
                self?.messages.append(message)
                self?.messages.sort { $0.timestamp > $1.timestamp }
                self?.view?.reloadData()
            }
        }
        dataReceiveManager.beginReceiving()
    }

}
