//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 21/02/2023.
//

import Foundation

open class BaseMainRequest: Codable {
    
    public init() {}
    
    open func encodeConfigs(encoder: Encoder) throws {
        guard let configs = SmilesBaseMainRequestManager.shared.baseMainRequestConfigs else { return }
        try configs.encode(to: encoder)
    }
    
}
