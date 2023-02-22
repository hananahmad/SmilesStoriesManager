//
//  StoriesServiceUseCase.swift
//  House
//
//  Created by Muhammad Shayan Zahid on 28/10/2022.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import Foundation
import Combine
import NetworkingLayer

protocol StoriesServiceable {
    func getStories(request: StoriesRequestModel) -> AnyPublisher<Stories, NetworkError>
    func updateWishList(request: WishListRequestModel) -> AnyPublisher<WishListResponseModel, NetworkError>
}

// getstoriesrepository
class GetStoriesRepository: StoriesServiceable {
    
    private var networkRequest: Requestable
    private var baseURL: String
    private var endPoint: StoriesEndPoints

  // inject this for testability
    init(networkRequest: Requestable, baseURL: String, endPoint: StoriesEndPoints) {
        self.networkRequest = networkRequest
        self.baseURL = baseURL
        self.endPoint = endPoint
    }
    
    func getStories(request: StoriesRequestModel) -> AnyPublisher<Stories, NetworkError> {
        let endPoint = StoriesRequestBuilder.getStories(request: request)
        let request = endPoint.createRequest(
            baseURL: baseURL,
            endPoint: self.endPoint
        )
        
        return self.networkRequest.request(request)
    }
    
    func updateWishList(request: WishListRequestModel) -> AnyPublisher<WishListResponseModel, NetworkError> {
        let endPoint = StoriesRequestBuilder.updateWishList(request: request)
        let request = endPoint.createRequest(
            baseURL: baseURL,
            endPoint: self.endPoint
        )
        
        return self.networkRequest.request(request)
    }
}
