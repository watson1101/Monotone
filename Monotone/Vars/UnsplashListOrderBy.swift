//
//  UnsplashListOrderBy.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/11/15.
//

import UIKit

enum UnsplashListOrderBy{
    case popular
    case latest
}

extension UnsplashListOrderBy: RawRepresentable, CaseIterable{
    init?(rawValue: (key:String, description:String)) {
        switch rawValue {
        
        case (key: "popular",
              description : NSLocalizedString("unsplash_home_segment_popular", comment: "Popular")):
            self = .popular
            
        case (key: "latest",
              description : NSLocalizedString("unsplash_home_segment_latest", comment: "latest")):
            self = .latest
            
        default:
            return nil
        }
    }
    
    var rawValue: (key:String, description:String) {
        switch self {
        
        case .popular:
            return (key: "popular",
                    description : NSLocalizedString("unsplash_home_segment_popular", comment: "Popular"))
            
        case .latest:
            return (key: "latest",
                    description : NSLocalizedString("unsplash_home_segment_latest", comment: "latest"))
        }
    }
}