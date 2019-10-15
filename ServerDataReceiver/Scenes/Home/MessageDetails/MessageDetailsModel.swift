//
//  MessageDetailsModel.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/15/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

struct MessageDetailsModel {
    var timestamp: Double
    var messageText: String

    var timestampString: String {
        return String(timestamp)
    }
}

extension MessageDetailsModel {
    init(message: Message) {
        timestamp = message.timestamp
        messageText = message.text
    }
}
