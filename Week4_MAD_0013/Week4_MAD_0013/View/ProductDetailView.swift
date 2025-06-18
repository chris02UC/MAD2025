//
//  ProductDetailView.swift
//  Week4_MAD_0013
//
//  Created by student on 13/03/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.dismiss) var dismiss

    let icon: String
    let iconColor: Color
    let productName: String
    let description: String
    let price: String
    
    let productsInCategory: [(icon: String, iconColor: Color, productName: String, description: String, price: String)]
    
    @State private var selectedProduct: (icon: String, iconColor: Color, productName: String, description: String, price: String)
    
    init(icon: String, iconColor: Color, productName: String, description: String, price: String, productsInCategory: [(icon: String, iconColor: Color, productName: String, description: String, price: String)]) {
        
        self.icon = icon
        self.iconColor = iconColor
        self.productName = productName
        self.description = description
        self.price = price
        self.productsInCategory = productsInCategory
        
        _selectedProduct = State(initialValue: (icon, iconColor, productName, description, price))
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()

            Image(systemName: selectedProduct.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(selectedProduct.iconColor)

            Text(selectedProduct.productName)
                .font(.title.bold())

            Text(selectedProduct.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Text("Price: \(selectedProduct.price)")
                .font(.title2.bold())

            Button(action: {
                goToRandomProduct()
            }) {
                Text("Go to Random Product")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func goToRandomProduct() {
        let otherProducts = productsInCategory.filter { $0.productName != selectedProduct.productName }
        
        if let random = otherProducts.randomElement() {
            selectedProduct = random
        }
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(
            icon: "tennis.racket",
            iconColor: .green,
            productName: "Tennis Racket",
            description: "Professional tennis racket for enthusiasts.",
            price: "$129.99",
            productsInCategory: [
                ("sportscourt", .yellow, "Football", "High-quality football for the field.", "$39.99"),
                ("tennis.racket", .green, "Tennis Racket", "Professional tennis racket for enthusiasts.", "$129.99"),
                ("arrow.counterclockwise", .purple, "Yoga Mat", "Comfortable mat for your yoga sessions.", "$29.99")
            ]
        )
    }
}
