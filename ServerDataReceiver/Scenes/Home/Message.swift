//
//  Message.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/14/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation

struct Message: Codable {
    let timestamp: Double
    let text: String

    enum CodingKeys: String, CodingKey {
        case timestamp
        case text = "message"
    }
}

extension Message {
    init?(jsonData: Data) {
        do {
            let message = try JSONDecoder().decode(Message.self, from: jsonData)
            timestamp = message.timestamp
            text = message.text
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
