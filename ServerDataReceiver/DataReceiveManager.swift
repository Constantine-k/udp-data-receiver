//
//  DataReceiveManager.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/7/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

final class DataReceiveManager: NSObject, GCDAsyncUdpSocketDelegate {

    var didReceiveDataAction: ((_ data: Data, _ address: Data) -> Void)?

    private let serverIP = "127.0.0.1"
    private let port: UInt16 = 12345

    private var socket: GCDAsyncUdpSocket!

    override init() {
        super.init()
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: DispatchQueue.main)
    }

    convenience init(delegateQueue: DispatchQueue) {
        self.init()
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: delegateQueue)
    }

    func beginReceiving() {
        do {
            try socket.bind(toPort: port)
            try socket.beginReceiving()
        } catch {
            print(error.localizedDescription)
        }
    }

    func pauseReceiving() {
        socket.pauseReceiving()
    }

    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?) {
        didReceiveDataAction?(data, address)
    }

}
