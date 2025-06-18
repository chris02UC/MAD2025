//
//  BreathingView.swift
//  Week7_0013_MAD
//
//  Created by student on 10/04/25.
//

import SwiftUI

struct BreathingView: View {
    @StateObject var breathingViewModel: BreathingViewModel = BreathingViewModel()

    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(breathingViewModel.color)
                .frame(width: 150, height: 150)
                .scaleEffect(breathingViewModel.scale)
                .animation(.easeInOut(duration: 3), value: breathingViewModel.scale)
                .padding(.top, 50)

            Text("Session Time: \(breathingViewModel.duration) sec")
                .font(.subheadline)

            Button(breathingViewModel.isBreathing ? "Stop" : "Start") {
                breathingViewModel.isBreathing ?
                    breathingViewModel.stopSession() :
                    breathingViewModel.startSession()
            }
            .foregroundColor(.blue)
            .padding(.top, 10)

            if !breathingViewModel.sessionHistory.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach(breathingViewModel.sessionHistory) { session in
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Start: \(formattedDate(session.startTime))")
                                    Text("Duration: \(session.duration) sec")
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 1)
                            }
                        }
                        .padding()
                    }
                    .frame(height: 550)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(16)
                }
                .padding(.top, 20)
            }
            Spacer()
        }
        .padding(.horizontal)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy, HH.mm.ss"
        return formatter.string(from: date)
    }
}


#Preview {
    BreathingView()
}
