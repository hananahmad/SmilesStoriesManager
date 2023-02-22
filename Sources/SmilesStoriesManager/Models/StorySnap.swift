//
//  StorySnap.swift
//
//  Created by Shmeel Ahmed on 31/10/2022.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import Foundation

public enum MediaType: String {
    case image
    case video
    case animation
    case unknown
}

public struct StorySnap: Codable {
    public var internalIdentifier: String? = ""
    // Store the deleted snaps id in NSUserDefaults, so that when app get relaunch deleted snaps will not display.
    public var isDeleted: Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: internalIdentifier ?? "")
        }
        get{
            return UserDefaults.standard.value(forKey: internalIdentifier ?? "") != nil
        }
    }

    public var type: MediaType {
        switch mediaType {
        case MediaType.image.rawValue:
            return .image
        case MediaType.video.rawValue:
            return .video
        case MediaType.animation.rawValue:
            return .animation
        default:
            return .unknown
        }
    }

    var title, storyDetailDescription: String?
    var logoUrl: String?
    var endDate: String?
    var length: Int?
    var mediaType: String?
    var mediaUrl = ""
    var redirectionUrl, uniqueIdentifier, location: String?
    var isSharingAllowed, isFavoriteAllowed, isInfoAllowed, isFavorite, isbuttonEnabled: Bool?
    var buttonTitle, infoUrl: String?
    var restaurantInfoShareText:  String?
    var restaurantRating: Double?
    var promotionText: String?
    var merchantLocations: [MerchantLocation]?
    var points: String?
    var cost: String?
    var formattedEndDate:String? {
        if let date = stringToUTCDate(dateString: endDate) {
            let difference = Calendar.current.dateComponents([.day, .hour, .minute], from: Date(), to: date)
            return String(format:"%02d days : %02d hrs : %02d mins",difference.day ?? 0, difference.hour ?? 0, difference.minute ?? 0)
        }
        return nil
    }
    
    var isOfferStory:Bool{
        return points != nil && cost != nil && promotionText == nil
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case storyDetailDescription = "description"
        case logoUrl
        case endDate, length, mediaType
        case mediaUrl
        case redirectionUrl
        case uniqueIdentifier, location, isSharingAllowed, isFavoriteAllowed, isInfoAllowed, isFavorite, isbuttonEnabled, buttonTitle, merchantLocations
        case infoUrl
        case restaurantInfoShareText
        case restaurantRating
        case points
        case cost
        case promotionText
    }
    
    func stringToUTCDate(dateString: String?) -> Date? {
        
        guard let dateString else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone?
        if let date1 = dateFormatter.date(from: dateString) {
            return date1
        }
        return nil
        
    }
    
}

// MARK: - MerchantLocation
struct MerchantLocation: Codable {
    var locationName, locationAddress: String?
    var locationLatitude, locationLongitude: Double?
    var distance: Int?
    var locationPhoneNumber: String?
}
