//
//  SportsView.swift
//  Week4_MAD_0013
//

import SwiftUI

struct SportsView: View {
    
    let sportsProducts: [(icon: String, iconColor: Color, productName: String, description: String, price: String)] = [
        ("sportscourt", .yellow, "Football", "High-quality football for the field.", "$39.99"),
        ("tennisball", .green, "Tennis Racket", "Professional tennis racket for enthusiasts.", "$129.99"),
        ("leaf.arrow.trianglehead.clockwise", .purple, "Yoga Mat", "Comfortable mat for your yoga sessions.", "$29.99")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    
                    Text("Sports")
                        .font(.largeTitle.bold())
                        .padding(.top, 16)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Text("Sports and fitness equipment")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    VStack(spacing: 16) {
                        ForEach(0..<sportsProducts.count, id: \.self) { index in
                            let product = sportsProducts[index]
                            
                            NavigationLink(destination:
                                ProductDetailView(
                                    icon: product.icon,
                                    iconColor: product.iconColor,
                                    productName: product.productName,
                                    description: product.description,
                                    price: product.price,
                                    productsInCategory: sportsProducts
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
    SportsView()
}
