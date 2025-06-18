//
//  DeviceRowView.swift
//  Week3_MAD_0706012310013
//
//  Created by student on 06/03/25.
//

import SwiftUI

struct DeviceRowView: View {
    let deviceName: String
    let description: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 60, height: 60)

                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .foregroundColor(color)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(deviceName)
                    .font(.headline)
                    .foregroundColor(.black)

                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2) 
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.1), lineWidth: 1))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
    }
}

#Preview {
    DeviceRowView(
        deviceName: "iPhone 16",
        description: "iPhone 16 is built for Apple Intelligence, the personal intelligence iPhone 16 is built for Apple Intelligence, the personal intelligence iPhone 16 is built for Apple Intelligence, the personal intelligence",
        icon: "iphone.gen1",
        color: .blue
    )
    .background(Color(UIColor.systemGroupedBackground))
}
