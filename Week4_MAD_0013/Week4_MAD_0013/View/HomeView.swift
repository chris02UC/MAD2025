//
//  HomeView.swift
//  Week4_MAD_0013
//

import SwiftUI

struct HomeView: View {
    
    let homeProducts: [(icon: String, iconColor: Color, productName: String, description: String, price: String)] = [
        ("sofa", .gray, "Sofa", "Comfortable sofa for your living room.", "$599.99"),
        ("tablecells", .red, "Dining Table", "Elegant dining table for family gatherings.", "$499.99"),
        ("microwave", .blue, "Microwave", "Fast and efficient microwave for your kitchen.", "$199.99")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    
                    // Title
                    Text("Home")
                        .font(.largeTitle.bold())
                        .padding(.top, 16)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Subtitle
                    Text("Furniture and home appliances")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    // Product List
                    VStack(spacing: 16) {
                        ForEach(0..<homeProducts.count, id: \.self) { index in
                            let product = homeProducts[index]
                            
                            NavigationLink(destination:
                                ProductDetailView(
                                    icon: product.icon,
                                    iconColor: product.iconColor,
                                    productName: product.productName,
                                    description: product.description,
                                    price: product.price,
                                    productsInCategory: homeProducts
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
    HomeView()
}
