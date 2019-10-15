//
//  Message.swift
//  ServerDataReceiver
//
//  Created by Konstantin Konstantinov on 10/14/19.
//  Copyright © 2019 Konstantin Konstantinov. All rights reserved.
//

import Foundation
import RealmSwift

class Message: Object {
    @objc dynamic var timestamp: Double = 0.0
    @objc dynamic var text: String = ""

    convenience init?(jsonData: Data) {
        do {
            let message = try JSONDecoder().decode(MessageStruct.self, from: jsonData)
            self.init()
            timestamp = message.timestamp
            text = message.text
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

fileprivate struct MessageStruct: Codable {
    let timestamp: Double
    let text: String

    enum CodingKeys: String, CodingKey {
        case timestamp
        case text = "message"
    }
}
