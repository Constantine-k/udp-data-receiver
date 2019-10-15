//
//  HomeViewModel.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/15/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation
import RealmSwift

protocol HomeView: class {
    func reloadData()
}

class HomeViewModel {

    var messages = [Message]() {
        didSet {
            messages = messages.sorted { $0.timestamp > $1.timestamp }
        }
    }

    private weak var view: HomeView?
    private lazy var realm = { try! Realm() }()
    private let dataReceiveManager = DataReceiveManager(delegateQueue: DispatchQueue.global(qos: .userInitiated))

    convenience init(view: HomeView) {
        self.init()
        self.view = view
    }

    private init() {}

    func startReceivingMessages() {
        dataReceiveManager.didReceiveDataAction = { [weak self] data, _ in
            if let message = Message(jsonData: data) {
                self?.messages.append(message)
                self?.view?.reloadData()

                try! self?.realm.write {
                    self?.realm.add(message)
                }
            }
        }
        dataReceiveManager.beginReceiving()
    }

    func fetchSavedMessages() {
        let messagesResults = realm.objects(Message.self)
        let messagesArray = Array(messagesResults)

        messages = messages.isEmpty ? messagesArray : messages + messagesArray
    }

}
