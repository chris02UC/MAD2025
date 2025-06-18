//
//  MoodCardView.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import SwiftUI

struct MoodCardView: View {
    let mood: MoodEntry
    
    var body: some View {
        ZStack(alignment: .leading) {

            RoundedRectangle(cornerRadius: 12)
                .fill(moodColor)

            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 1)
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(borderColor)
                    .frame(height: 3)
                
                Spacer()
                
                Rectangle()
                    .fill(borderColor)
                    .frame(height: 3)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {

                Text("\(moodEmoji) \(mood.mood.rawValue)")
                    .font(.system(size: 22, weight: .semibold))
                
                Text("Note: \(mood.note)")
                    .font(.system(size: 16))
                    .italic()
            
                Text("Logged on \(formatDate(mood.date)) at \(formatTime(mood.date))")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding()
        }

        .frame(height: 120)
        .padding(.horizontal)
    }
    
    private var moodColor: Color {
        switch mood.mood {
        case .happy:
            return Color(red: 0.86, green: 1.0, blue: 0.86)
        case .neutral:
            return Color(red: 1.0, green: 1.0, blue: 0.8)
        case .sad:
            return Color(red: 1.0, green: 0.8, blue: 0.8)
        }
    }
    
    private var borderColor: Color {
        switch mood.mood {
        case .happy:
            return Color(red: 0.35, green: 0.75, blue: 0.35)
        case .neutral:
            return Color(red: 0.8, green: 0.8, blue: 0.6)
        case .sad:
            return Color(red: 0.9, green: 0.7, blue: 0.7)
        }
    }
    
    private var moodEmoji: String {
        switch mood.mood {
        case .happy:   return "😊"
        case .neutral: return "😐"
        case .sad:     return "😢"
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH.mm"
        return formatter.string(from: date)
    }
}

#Preview {
    MoodCardView(
        mood: MoodEntry(
            date: Date(),
            mood: .happy,
            note: "Great walk outside!"
        )
    )
    .environmentObject(MoodViewModel())
}
