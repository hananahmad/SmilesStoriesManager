//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 21/02/2023.
//

import Foundation

open class SmilesBaseMainRequestConfigurations : Codable {
    
    public var encryptionkey: String?
    public var initVector: String?
    public var additionalInfo: [SmilesBaseMainResponseAdditionalInfo]?
    public var appVersion : String?
    public var authToken : String?
    public var channel : String?
    public var deviceId : String?
    public var handsetModel : String?
    public var imsi : String?
    public var isGpsEnabled : Bool?
    public var isNotificationEnabled : Bool?
    @objc public var lang : String?
    @objc public var msisdn : String?
    public var osVersion : String?
    public var token : String?
    public var hashId : String?
    public var deviceHashId : String?
    
    enum CodingKeys: String, CodingKey {
        case encryptionkey = "encryptionkey"
        case initVector = "initVector"
        case additionalInfo = "additionalInfo"
        case appVersion = "appVersion"
        case authToken = "authToken"
        case channel = "channel"
        case deviceId = "deviceId"
        case handsetModel = "handsetModel"
        case imsi = "imsi"
        case isGpsEnabled = "isGpsEnabled"
        case isNotificationEnabled = "isNotificationEnabled"
        case lang = "lang"
        case msisdn = "msisdn"
        case osVersion = "osVersion"
        case token = "token"
        case hashId = "hashId"
        case deviceHashId = "deviceHashId"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.encryptionkey, forKey: .encryptionkey)
        try container.encodeIfPresent(self.initVector, forKey: .initVector)
        try container.encode(self.additionalInfo, forKey: .additionalInfo)
        try container.encodeIfPresent(self.appVersion, forKey: .appVersion)
        try container.encodeIfPresent(self.authToken, forKey: .authToken)
        try container.encodeIfPresent(self.channel, forKey: .channel)
        try container.encodeIfPresent(self.deviceId, forKey: .deviceId)
        try container.encodeIfPresent(self.handsetModel, forKey: .handsetModel)
        try container.encodeIfPresent(self.imsi, forKey: .imsi)
        try container.encodeIfPresent(self.isGpsEnabled, forKey: .isGpsEnabled)
        try container.encodeIfPresent(self.isNotificationEnabled, forKey: .isNotificationEnabled)
        try container.encodeIfPresent(self.lang, forKey: .lang)
        try container.encodeIfPresent(self.msisdn, forKey: .msisdn)
        try container.encodeIfPresent(self.osVersion, forKey: .osVersion)
        try container.encodeIfPresent(self.token, forKey: .token)
        try container.encodeIfPresent(self.hashId, forKey: .hashId)
        try container.encodeIfPresent(self.deviceHashId, forKey: .deviceHashId)
    }
    
    required public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        additionalInfo = try values.decode([SmilesBaseMainResponseAdditionalInfo].self, forKey: .additionalInfo)
        appVersion = try values.decodeIfPresent(String.self, forKey: .appVersion)
        authToken = try values.decodeIfPresent(String.self, forKey: .authToken)
        channel = try values.decodeIfPresent(String.self, forKey: .channel)
        deviceId = try values.decodeIfPresent(String.self, forKey: .deviceId)
        handsetModel = try values.decodeIfPresent(String.self, forKey: .handsetModel)
        imsi = try values.decodeIfPresent(String.self, forKey: .imsi)
        isGpsEnabled = try values.decodeIfPresent(Bool.self, forKey: .isGpsEnabled)
        isNotificationEnabled = try values.decodeIfPresent(Bool.self, forKey: .isNotificationEnabled)
        lang = try values.decodeIfPresent(String.self, forKey: .lang)
        msisdn = try values.decodeIfPresent(String.self, forKey: .msisdn)
        osVersion = try values.decodeIfPresent(String.self, forKey: .osVersion)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        hashId = try values.decodeIfPresent(String.self, forKey: .hashId)
        deviceHashId = try values.decodeIfPresent(String.self, forKey: .deviceHashId)
        
    }
    
    init(encryptionKey: String, initVector: String, additionalInfo: [SmilesBaseMainResponseAdditionalInfo], appVersion: String?, authToken: String?, channel: String?, deviceId: String?, handsetModel: String?, imsi: String?, isGpsEnabled: Bool?, isNotificationEnabled: Bool?, langauge: String?, msisdn: String?, osVersion: String?, token: String?, hashId: String?, deviceHashId: String?) {
        
        self.encryptionkey = encryptionKey
        self.initVector = initVector
        self.additionalInfo = additionalInfo
        self.appVersion = appVersion
        self.authToken = authToken
        self.channel = channel
        self.deviceId = deviceId
        self.handsetModel = handsetModel
        self.imsi = imsi
        self.isGpsEnabled = isGpsEnabled
        self.isNotificationEnabled = isNotificationEnabled
        self.lang = langauge
        self.msisdn = msisdn
        self.osVersion = osVersion
        self.token = token
        self.hashId = hashId
        self.deviceHashId = deviceHashId
        
    }
    
    
    
}
