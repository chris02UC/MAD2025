//
//  CategoryItemView.swift
//  Week4_MAD_0013
//
//  Created by student on 13/03/25.
//

import SwiftUI

struct CategoryItemView: View {
    let icon: String
    let color: Color
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(width: 160, height: 160)
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)
                    .foregroundColor(color)
            }
            
            Text(title)
                .font(.title.bold())
                .foregroundColor(.blue)
                .padding(.bottom, 4)
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 260)
    }
}

#Preview {
    CategoryItemView(
        icon: "iphone",
        color: .blue,
        title: "Electronics",
        subtitle: "Latest gadgets and devices"
    )
    .padding()
}
