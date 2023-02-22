//
//  StoriesEndPoints.swift
//  House
//
//  Created by Muhammad Shayan Zahid on 28/10/2022.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import Foundation

public enum StoriesEndPoints: String, CaseIterable {
    case storiesList
    case updateWishlist
}

extension StoriesEndPoints {
    var serviceEndPoints: String {
        switch self {
        case .storiesList:
            return "home/v2/stories"
        case .updateWishlist:
            return "home/update-wishlist"
        }
    }
}
