//
//  Stories.swift
//  House
//
//  Created by Shmeel Ahmed on 31/10/2022.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

// MARK: - Stories
public struct Stories: Codable {
    var extTransactionID:String? = ""
    var stories: [Story]?

    enum CodingKeys: String, CodingKey {
        case extTransactionID = "extTransactionId"
        case stories
    }
}
