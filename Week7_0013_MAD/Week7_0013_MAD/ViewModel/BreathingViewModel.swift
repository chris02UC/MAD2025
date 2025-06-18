//
//  BreathingViewModel.swift
//  Week7_0013_MAD
//
//  Created by student on 10/04/25.
//

import Foundation
import SwiftUI
import Combine
import WatchConnectivity

class BreathingViewModel: NSObject, ObservableObject, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    @Published var isBreathing = false
    @Published var scale: CGFloat = 1.0
    @Published var color: Color = .blue
    @Published var sessionHistory: [SessionRecord] = []
    @Published var duration: Int = 0

    var session: WCSession
    private var timer: AnyCancellable?
    private var animationTimer: AnyCancellable?
    private var startTime: Date?
    
    override init() {
        self.session = WCSession.default
        super.init()
        session.delegate = self
        session.activate()
    }

    func startSession() {
        isBreathing = true
        startTime = Date()
        duration = 0

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.duration += 1
            }

        animateBreath()

        animationTimer = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.animateBreath()
            }
    }

    private func animateBreath() {
        withAnimation(.easeInOut(duration: 1.5)) {
            self.scale = 2
            self.color = .purple
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                self.scale = 1.0
                self.color = .blue
            }
        }
    }

    func stopSession() {
        isBreathing = false
        timer?.cancel()
        animationTimer?.cancel()

        guard let start = startTime else { return }

        let session = SessionRecord(
            startTime: start,
            endTime: Date(),
            duration: duration
        )

        sessionHistory.insert(session, at: 0)
        duration = 0
    }

    func formattedTime(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let duration = message["duration"] as? Int {
                let now = Date()
                let record = SessionRecord(
                    startTime: now.addingTimeInterval(TimeInterval(-duration)),
                    endTime: now,
                    duration: duration
                )
                self.sessionHistory.insert(record, at: 0)
            }
        }
    }
}
