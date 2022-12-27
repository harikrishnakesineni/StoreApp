//
//  Product.swift
//  StoreApp
//
//  Created by Hari krishna on 24/12/22.
//

import Foundation

struct Product: Codable {
    let id: Int?
    let title: String
    let price: Double
    let description: String
    let category: Category
    let images: [URL]?
}
