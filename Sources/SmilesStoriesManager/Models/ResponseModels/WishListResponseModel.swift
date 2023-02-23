//
//  WishListResponseModel.swift
//  House
//
//  Created by Hanan Ahmed on 11/2/22.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import Foundation

public struct WishListResponseModel : Codable {
    
    let extTransactionId: String?
    let updateWishlistStatus : Bool?
    let responseMessage : String?
    let responseCode: String?
    
}
