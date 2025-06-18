//
//  BreathingViewMac.swift
//  Mac-Animation-Multiplatform
//
//  Created by student on 10/04/25.
//

import SwiftUI

struct BreathingViewMac: View {
    @ObservedObject var viewModel = BreathingViewModelMac()

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Circle()
                .fill(viewModel.color)
                .frame(width: 150, height: 150)
                .scaleEffect(viewModel.scale)
                .animation(.easeInOut(duration: 1.5), value: viewModel.scale)

            Text("Session Time: \(viewModel.duration) sec")
                .font(.title2)

            Button(viewModel.isBreathing ? "Stop" : "Start") {
                viewModel.isBreathing ? viewModel.stopSession() : viewModel.startSession()
            }
            .frame(width: 120, height: 40)
            .foregroundColor(.white)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                if viewModel.sessionHistory.isEmpty {
                    Text("")
                } else {
                    ForEach(viewModel.sessionHistory) { session in
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Start: \(formatted(session.startTime))")
                            Text("Duration: \(session.duration) sec")
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)
            .background(Color.black)
            .cornerRadius(12)

            Spacer()
        }
        .padding()
        .frame(minWidth: 400, minHeight: 600)
    }

    func formatted(_ date: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "dd/MM/yy, HH:mm:ss"
        return f.string(from: date)
    }
}



#Preview {
    BreathingViewMac()
}
