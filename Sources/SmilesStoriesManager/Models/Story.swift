//
//  Story.swift
//
//  Created by Shmeel Ahmed on 31/10/2022.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import Foundation
// MARK: - Story
public struct Story: Codable, Equatable {
    var lastPlayedSnapIndex:Int? = 0
    var isCompletelyVisible:Bool? = false
    var isCancelledAbruptly:Bool? = false
    var storyID: String?
    var title: String? = nil
    var storyDescription: String? = nil
    var logoUrl: String? = nil
    var imageUrl: String? = nil
    var snaps: [StorySnap]? = []
    
    public static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.storyID == rhs.storyID
    }
    
    enum CodingKeys: String, CodingKey {
        case storyID = "id"
        case title
        case storyDescription = "description"
        case logoUrl
        case imageUrl
        case snaps = "storyDetails"
    }
}
