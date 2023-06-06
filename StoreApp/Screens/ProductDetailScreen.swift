//
//  ProductDetailScreen.swift
//  StoreApp
//
//  Created by Hari krishna on 08/02/23.
//

import SwiftUI

struct ProductDetailScreen: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(product.images ?? [], id: \.self) { imageURL in
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                        } placeholder: {
                            ProgressView()
                        }
                        
                    }
                }
                Text(product.description)
                
                Text(product.price, format: .currency(code: Locale.currencyCode))
                    .padding(5)
                    .foregroundColor(.white)
                    .background {
                        Color.green
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
            }
            
        }.padding()
            .navigationTitle(product.title)
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailScreen(product: Product(id: 1, title: "testprod", price: 2.0, description: "test", category: Category(id: 1, name: "elctronics", image: URL(string:"https://placeimg.com/640/480/any?r=0.9178516507833767")!), images:[URL(string:"https://placeimg.com/640/480/any?r=0.9178516507833767")!,URL(string:"https://placeimg.com/640/480/any?r=0.9178516507833767")!]))
    }
}
