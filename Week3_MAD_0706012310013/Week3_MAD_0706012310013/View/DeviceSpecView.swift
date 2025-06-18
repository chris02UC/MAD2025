//
//  DeviceSpecView.swift
//  MyDevicesApp
//
//  Created by student on 06/03/25.
//

import SwiftUI

struct DeviceSpecView: View {
    let deviceName: String
    let color: Color
    let specifications: [(title: String, value: String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            Text("\(deviceName)\nSpecifications")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(
                    LinearGradient(colors: [color, color.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
                )
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Specifications")
                    .font(.headline)
                    .foregroundColor(.gray)

                ForEach(specifications, id: \.title) { spec in
                    specRow(title: spec.title, value: spec.value)
                }
            }
            .padding(.horizontal, 20)

            Spacer()
        }
        .padding(.top, 40)
        .navigationBarTitleDisplayMode(.inline)
    }
    

    private func specRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)

            Spacer()

            Text(value)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        DeviceSpecView(
            deviceName: "iPhone 16",
            color: .blue,
            specifications: [
                ("Weight", "174g"),
                ("Storage", "256GB"),
                ("RAM", "8GB"),
                ("Processor", "A17 Bionic"),
                ("Battery Life", "22 hours")
            ]
        )
    }
}
