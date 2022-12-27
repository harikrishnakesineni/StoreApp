//
//  ProductList.swift
//  StoreApp
//
//  Created by Hari krishna on 25/12/22.
//

import SwiftUI

struct ProductList: View {
    @EnvironmentObject var storeModel: StoreModel
    @State private var isPresented = false
    let category: Category
    var body: some View {
        List(storeModel.products, id: \.id) { product in
            ProductCellView(product: product)
        }
        .listStyle(.plain)
        .navigationTitle(category.name)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Product") {
                    isPresented = true
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddProductScreen()
        }
        .task {
            do {
                try await storeModel.getProductsByCategory(category.id)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductList(category: Category(id: 1, name: "Clothes", image: URL(string: "https://placeimg.com/640/480/any?r=0.9178516507833767")!)).environmentObject(StoreModel())
        }
    }
}
