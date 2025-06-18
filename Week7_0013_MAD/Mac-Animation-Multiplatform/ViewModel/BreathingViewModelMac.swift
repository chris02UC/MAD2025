//
//  BreathingViewModelMac.swift
//  Mac-Animation-Multiplatform
//
//  Created by student on 10/04/25.
//

import Foundation
import SwiftUI
import Combine

class BreathingViewModelMac: ObservableObject {
    @Published var isBreathing = false
    @Published var scale: CGFloat = 1.0
    @Published var color: Color = .blue
    @Published var duration: Int = 0
    @Published var sessionHistory: [SessionRecord] = []

    private var timer: AnyCancellable?
    private var animationTimer: AnyCancellable?
    private var startTime: Date?

    func startSession() {
        isBreathing = true
        startTime = Date()
        duration = 0
        animateBreath()

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.duration += 1
            }

        animationTimer = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.animateBreath()
            }
    }

    func stopSession() {
        isBreathing = false
        timer?.cancel()
        animationTimer?.cancel()

        guard let start = startTime else { return }

        let record = SessionRecord(
            startTime: start,
            endTime: Date(),
            duration: duration
        )

        sessionHistory.insert(record, at: 0)
        duration = 0
    }

    private func animateBreath() {
        withAnimation(.easeInOut(duration: 1.5)) {
            scale = 2.0
            color = .purple
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                self.scale = 1.0
                self.color = .blue
            }
        }
    }
}
