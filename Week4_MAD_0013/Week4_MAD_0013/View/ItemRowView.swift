//
//  ItemRowView.swift
//  Week4_MAD_0013
//
//  Created by student on 13/03/25.
//

import SwiftUI

struct ItemRowView: View {
    
    let icon: String
    let iconColor: Color
    let title: String
    let description: String
    let price: String
    
    var body: some View {
        HStack(spacing: 12) {
            
            // Icon
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(iconColor)
            
            // VStack containing title, description, price
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.title2.bold())
                    .foregroundColor(.blue)
                
                Text(description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Text(price)
                    .font(.title3.bold())
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ItemRowView(
        icon: "sportscourt",
        iconColor: .yellow,
        title: "Football",
        description: "High-quality football for the field.",
        price: "$39.99"
    )
    .padding()
}
