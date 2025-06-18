//
//  ElectronicsView.swift
//  Week4_MAD_0013
//

import SwiftUI

struct ElectronicsView: View {
    
    let electronicsProducts: [(icon: String, iconColor: Color, productName: String, description: String, price: String)] = [
        ("iphone", .blue, "Smartphone", "The latest smartphone with cutting-edge technology.", "$799.99"),
        ("laptopcomputer", .green, "Laptop", "High-performance laptop for work and play.", "$1,299.99"),
        ("applewatch", .orange, "Smartwatch", "Track your health and stay connected with this smartwatch.", "$399.99")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    
                    // Title
                    Text("Electronics")
                        .font(.largeTitle.bold())
                        .padding(.top, 16)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Subtitle
                    Text("Latest gadgets and devices")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Product List
                    VStack(spacing: 16) {
                        ForEach(0..<electronicsProducts.count, id: \.self) { index in
                            let product = electronicsProducts[index]
                            
                            NavigationLink(destination:
                                ProductDetailView(
                                    icon: product.icon,
                                    iconColor: product.iconColor,
                                    productName: product.productName,
                                    description: product.description,
                                    price: product.price,
                                    productsInCategory: electronicsProducts
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
    ElectronicsView()
}
