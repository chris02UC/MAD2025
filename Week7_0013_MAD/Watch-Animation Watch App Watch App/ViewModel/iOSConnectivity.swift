//
//  iOSConnectivity.swift
//  Watch-Animation Watch App Watch App
//
//  Created by student on 10/04/25.
//

import Foundation
import WatchConnectivity

class iOSConnectivity: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession

    override init() {
        self.session = WCSession.default
        super.init()
        session.delegate = self
        session.activate()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    func sendSession(duration: Int) {
        if session.isReachable {
            let message: [String: Any] = [
                "duration": duration
            ]
            session.sendMessage(message, replyHandler: nil) { error in
                print("Error sending message: \(error.localizedDescription)")
            }
        } else {
            print("Session not reachable")
        }
    }
}
