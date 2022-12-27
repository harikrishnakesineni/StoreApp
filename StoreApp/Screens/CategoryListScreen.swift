//
//  CategoryListScreen.swift
//  StoreApp
//
//  Created by Hari krishna on 24/12/22.
//

import SwiftUI

struct CategoryListScreen: View {
    @EnvironmentObject private var storeModel: StoreModel
    @State var errorMessage = ""
    var body: some View {
        NavigationStack {
            VStack {
                List(storeModel.categories, id: \.id) { category in
                    NavigationLink(value: category) {
                        HStack {
                            AsyncImage(url: category.image) { image in
                                image.image?
                                    .resizable()
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                            }
                            Text(category.name)
                        }
                    }
                    
                }
                .navigationDestination(for: Category.self, destination: { category in
                    ProductList(category: category)
                })
                .task {
                    do {
                        try await storeModel.fetchCategories()
                    } catch {
                        errorMessage = error.localizedDescription
                    }
                }
                Text(errorMessage)
                
            }
            .navigationTitle("Store")
        }
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen().environmentObject(StoreModel())
    }
}
