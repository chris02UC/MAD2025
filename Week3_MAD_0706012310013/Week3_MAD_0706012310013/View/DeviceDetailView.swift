//
//  DeviceDetailView.swift
//  Week3_MAD_0706012310013
//
//  Created by student on 06/03/25.
//

import SwiftUI

struct DeviceDetailView: View {
    let deviceName: String
    let description: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 220, height: 220)

                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(color)
            }
            
            Text(deviceName)
                .font(.title.bold())
                .foregroundStyle(
                    LinearGradient(colors: [color, color.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
                )

            VStack(alignment: .leading, spacing: 8) {
                Text("About")
                    .font(.headline)
                    .foregroundColor(.gray)

                Text(description)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)

            Spacer()

            NavigationLink(destination: DeviceSpecView(deviceName: deviceName, color: color, specifications: getSpecifications())) {
                Text("View Specifications")
//                    .font(.headline)
                    .frame(maxWidth: 150)
                    .padding()
                    .background(color.opacity(0.2))
                    .foregroundColor(color)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func getSpecifications() -> [(title: String, value: String)] {
        switch deviceName {
        case "iPhone 16":
            return [
                ("Weight", "174g"),
                ("Storage", "256GB"),
                ("RAM", "8GB"),
                ("Processor", "A17 Bionic"),
                ("Battery Life", "22 hours")
            ]
        case "MacBook Pro":
            return [
                ("Weight", "1.2 kg"),
                ("Storage", "512GB SSD"),
                ("RAM", "16GB"),
                ("Processor", "M2 Chip"),
                ("Battery Life", "20 hours")
            ]
        case "Apple Watch":
            return [
                ("Weight", "38g"),
                ("Storage", "64GB"),
                ("RAM", "1GB"),
                ("Processor", "S9 Chip"),
                ("Battery Life", "18 hours")
            ]
        case "AirPods Pro 2":
            return [
                ("Weight", "5.4g each"),
                ("Noise Cancellation", "Yes"),
                ("Chip", "H2"),
                ("Charging Case", "MagSafe"),
                ("Battery Life", "6 hours")
            ]
        default:
            return []
        }
    }
}

#Preview {
    NavigationStack {
        DeviceDetailView(
            deviceName: "iPhone 16",
            description: "iPhone 16 is built for Apple Intelligence, the personal intelligence system that helps you write, express yourself, and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one else can access your data — not even Apple.",
            icon: "iphone.gen1",
            color: .blue
        )
    }
}
