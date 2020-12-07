//
//  Collection.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/11/8.
//

import Foundation
import ObjectMapper

class Collection: Mappable {

    var id: Int?
    var title: String?
    var coverPhoto: Photo?
    var description: String?
    var publishedAt: Date?
    var lastCollectedAt: Date?
    var updatedAt: Date?
    var totalPhotos: Int?
    var user: User?
    var shareKey: String?
    var links: Links?
    var isPrivate: Bool?

    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        coverPhoto      <- map["cover_photo"]
        description     <- map["description"]
        publishedAt     <- (map["published_at"], ISO8601DateTransform())
        lastCollectedAt <- (map["last_collected_at"], ISO8601DateTransform())
        updatedAt       <- (map["updated_at"], ISO8601DateTransform())
        user            <- map["user"]
        totalPhotos     <- map["total_photos"]
        shareKey        <- map["share_key"]
        links           <- map["links"]
        isPrivate       <- map["private"]
    }
}








