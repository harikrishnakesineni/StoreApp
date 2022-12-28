//
//  CreateProductRequest.swift
//  StoreApp
//
//  Created by Hari krishna on 28/12/22.
//

import Foundation

struct CreateProductRequest: Encodable {
    
    let title: String
    let price: Double
    let description: String
    let categoryId: Int
    let images: [URL]
    
}
