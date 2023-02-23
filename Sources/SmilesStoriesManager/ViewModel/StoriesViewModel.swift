//
//  StoriesViewModel.swift
//  House
//
//  Created by Hanan Ahmed on 11/2/22.
//  Copyright © 2022 Ahmed samir ali. All rights reserved.
//

import Foundation
import Combine
import NetworkingLayer

open class StoriesViewModel: NSObject {
    
    // MARK: - INPUT. View event methods
    public enum Input {
        case getStories(categoryId:Int, baseURL: String)
        case updateRestaurantWishlistStatus(operation: Int, restaurantId: String, baseURL: String)
        case updateOfferWishlistStatus(operation: Int, offerId: String, baseURL: String)
    }
    
    public enum Output {
        case fetchStoriesDidSucceed(response: Stories)
        case updateWishlistStatusDidSucceed(response: WishListResponseModel)
        case fetchDidFail(error: Error)
        case showHideLoader(shouldShow: Bool)
    }
    
    // MARK: -- Variables
    public var output: PassthroughSubject<Output, Never> = .init()
    public var cancellables = Set<AnyCancellable>()
    public var stories: Stories?
    
}

// MARK: - INPUT. View event methods
extension StoriesViewModel {
    
    public func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        output = PassthroughSubject<Output, Never>()
        input.sink { [weak self] event in
            switch event {
            case .getStories(let categoryId, let baseURL):
                self?.getStories(categoryId: categoryId, baseURL: baseURL)
            case .updateRestaurantWishlistStatus(let operation, let restaurantId, let baseURL):
                self?.updateWishlistStatus(with: operation, restaurantId: restaurantId, offerId: nil, baseURL: baseURL)
            case .updateOfferWishlistStatus(let operation, let offerId, let baseURL):
                self?.updateWishlistStatus(with: operation, restaurantId: nil, offerId: offerId, baseURL: baseURL)
            }
        }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
    
    
    func getStories(categoryId:Int, baseURL: String) {
        let storiesRequest = StoriesRequestModel(
            categoryId: categoryId
        )
        
        let service = GetStoriesRepository(
            networkRequest: NetworkingLayerRequestable(requestTimeOut: 60), baseURL: baseURL,
            endPoint: .storiesList
        )
        
        service.getStories(request: storiesRequest)
            .sink { [weak self] completion in
                debugPrint(completion)
                switch completion {
                case .failure(let error):
                    self?.output.send(.fetchDidFail(error: error))
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { [weak self] response in
                print("got my response here \(response)")
                self?.stories = response
                self?.output.send(.fetchStoriesDidSucceed(response: response))
            }
            .store(in: &cancellables)
    }
    
    func updateWishlistStatus(with operation: Int, restaurantId: String?, offerId: String?, baseURL: String) {

        self.output.send(.showHideLoader(shouldShow: true))

        let updateWishListRequest = WishListRequestModel(
            restaurantId: restaurantId,
            operation: operation,
            offerId: offerId
        )
        
        let service = GetStoriesRepository(
            networkRequest: NetworkingLayerRequestable(requestTimeOut: 60), baseURL: baseURL,
            endPoint: .updateWishlist
        )
        
        service.updateWishList(request: updateWishListRequest)
            .sink { [weak self] completion in
                debugPrint(completion)
                switch completion {
                case .failure(let error):
                    self?.output.send(.fetchDidFail(error: error))
                case .finished:
                    print("nothing much to do here")
                    self?.output.send(.showHideLoader(shouldShow: false))
                }
            } receiveValue: { [weak self] response in
                print("got my response here \(response)")
                self?.output.send(.updateWishlistStatusDidSucceed(response: response))
            }
        .store(in: &cancellables)
    }
    
}
