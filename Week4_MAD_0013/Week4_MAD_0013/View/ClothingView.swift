//
//  ClothingView.swift
//  Week4_MAD_0013
//

import SwiftUI

struct ClothingView: View {
    
    let clothingProducts: [(icon: String, iconColor: Color, productName: String, description: String, price: String)] = [
        ("tshirt", .brown, "Men's Jacket", "Stylish and warm jacket for everyday wear.", "$129.99"),
        ("jacket", .red, "Women's Dress", "Elegant dress for every occasion.", "$89.99"),
        ("shoe", .blue, "Shoes", "Comfortable shoes for all-day wear.", "$59.99")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    
                    // Title
                    Text("Clothing")
                        .font(.largeTitle.bold())
                        .padding(.top, 16)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Subtitle
                    Text("Newest Fashion and wearables")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Product List
                    VStack(spacing: 16) {
                        ForEach(0..<clothingProducts.count, id: \.self) { index in
                            let product = clothingProducts[index]
                            
                            NavigationLink(destination:
                                ProductDetailView(
                                    icon: product.icon,
                                    iconColor: product.iconColor,
                                    productName: product.productName,
                                    description: product.description,
                                    price: product.price,
                                    productsInCategory: clothingProducts
                                )
                            ) {
                                ItemRowView(
                                    icon: product.icon,
                                    iconColor: product.iconColor,
                                    title: product.productName,
                                    description: product.description,
                                    price: product.price
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ClothingView()
}
