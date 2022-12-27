//
//  URL+Extension.swift
//  StoreApp
//
//  Created by Hari krishna on 23/12/22.
//

import Foundation

extension URL {
    
    static var development: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var production: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var baseUrl: URL {
        #if DEBUG
            return development
        #else
            return production
        #endif
    }
    
    static var allCategories: URL {
        URL(string: "/api/v1/categories", relativeTo: Self.baseUrl)!
    }
    
    static func productsByCategory(_ categoryId:Int) -> URL {
        return URL(string: "/api/v1/categories/\(categoryId)/products", relativeTo: Self.baseUrl)!
    }
    
}
