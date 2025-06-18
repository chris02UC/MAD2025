//
//  WatchBreathingView.swift
//  Watch-Animation Watch App
//
//  Created by student on 10/04/25.
//

import SwiftUI

struct WatchBreathingView: View {
    @StateObject var connectivity = iOSConnectivity()
    
    @State private var isBreathing = false
    @State private var scale: CGFloat = 1.0
    @State private var color: Color = .blue
    @State private var duration = 0

    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var animationTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 16) {
                Spacer(minLength: 10)

                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(color)
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 1.5), value: scale)

                Text("\(duration) sec")
                    .foregroundColor(.white)
                    .font(.title3)

                Button(action: {
                    if isBreathing {
                        stopBreathing()
                    } else {
                        startBreathing()
                    }
                }) {
                    Text(isBreathing ? "Stop" : "Start")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .cornerRadius(8)
                }
                .padding(.top, 4)

                Spacer(minLength: 10)
            }
            .padding()
        }

        .onReceive(timer) { _ in
            if isBreathing {
                duration += 1
            }
        }
        .onReceive(animationTimer) { _ in
            if isBreathing {
                animateBreath()
            }
        }
    }

    func startBreathing() {
        isBreathing = true
        duration = 0
        animateBreath()
    }

    func stopBreathing() {
        isBreathing = false
        connectivity.sendSession(duration: duration)
        duration = 0
    }

    func animateBreath() {
        withAnimation(.easeInOut(duration: 1.5)) {
            scale = 2.0
            color = .purple
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 1.5)) {
                scale = 1.0
                color = .blue
            }
        }
    }
}

#Preview {
    WatchBreathingView()
}
