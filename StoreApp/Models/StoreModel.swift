//
//  StoreModel.swift
//  StoreApp
//
//  Created by Hari krishna on 23/12/22.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    @Published private(set) var categories: [Category] = []
    @Published private(set) var products: [Product] = []
    
    let client = StoreHTTPClient()
    
    func fetchCategories() async throws {
        
        categories = try await client.load(Resource(url: URL.allCategories))
//        categories = try await client.getCategories(url: URL.allCategories)
    }
    
    func getProductsByCategory(_ categoryId: Int) async throws {
        products = try await client.load(Resource(url: .productsByCategory(categoryId)))
//        products = try await client.getProductsByCategory(url: .productsByCategory(categoryId))
    }
    
}
