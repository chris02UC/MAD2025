//
//  DeviceListView.swift
//  MyDevicesApp
//
//  Created by student on 06/03/25.
//

import SwiftUI

struct DeviceListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                headerView

                ScrollView {
                    Spacer()
                    deviceList
                }
                .padding(.horizontal, 4)
            }
        }
    }
}

extension DeviceListView {
    
    private var headerView: some View {
        Text("My Devices")
            .font(.largeTitle.bold())
            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            .padding(.top, 8)
    }

    private var deviceList: some View {
        VStack(spacing: 12) {
            navigationLink(for: "iPhone 16", description: "iPhone 16 is built for Apple Intelligence, the personal intelligence system that helps you write, express yourself, and get things done effortlessly. With groundbreaking privacy protections, it gives you peace of mind that no one can access  you data - not even Apple.", icon: "iphone", color: .blue)

            navigationLink(for: "MacBook Pro", description: "MacbookPro features the most advanced lineup of chips ever built for a pro laptop. Phenomenal single- and mulithtreaded CPU performance, faster unified memory, enhanced machine learning accelerators.", icon: "laptopcomputer", color: .green)

            navigationLink(for: "Apple Watch", description: "Apple Watch can do what your other devices can't because it's on your wrist. When you wear it, you get meaningful health insights, a fitness partner that measures all the ways you move, a connection to the people you care about most, and advanced safety features.", icon: "applewatch", color: .red)

            navigationLink(for: "AirPods Pro 2", description: "AirPods Pro 2 take the listening experience to a new level of individuality. Personalized Spatial Audio with dynamic head tracking 4 works with all your devices to immerse you deeper in all-around-you sound when you're listening to music, wathcing a movie, or gaming.", icon: "airpodspro", color: .purple)
        }
        .padding(.top, 12)
    }

    private func navigationLink(for name: String, description: String, icon: String, color: Color) -> some View {
        NavigationLink(destination: DeviceDetailView(deviceName: name, description: description, icon: icon, color: color)) {
            DeviceRowView(deviceName: name, description: description, icon: icon, color: color)
        }
    }
}

#Preview {
    NavigationStack {
        DeviceListView()
    }
}
