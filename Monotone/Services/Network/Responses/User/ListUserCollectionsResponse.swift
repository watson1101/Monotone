//
//  ListUserCollectionsResponse.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/12/7.
//

import Foundation
import ObjectMapper

class ListUserCollectionsResponse: BaseResponse{
    public var results: [Collection]?
    
    override func mapping(map: Map) {
        results <- map["results"]
    }
}
