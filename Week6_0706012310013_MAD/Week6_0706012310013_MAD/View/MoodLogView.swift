//
//  MoodLogView.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import SwiftUI

struct MoodLogView: View {
    @EnvironmentObject var moodViewModel: MoodViewModel
    @State private var isAddingMood = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Daily Mood Tracker")
                .font(.system(size: 32, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                .padding(.horizontal)
                .padding(.bottom, 28)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(moodViewModel.groupedMoodsByDate(), id: \.date) { group in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(formatDate(group.date))
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
                            
                            ForEach(group.moods) { moodEntry in
                                MoodCardView(mood: moodEntry)
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }
            
            Button(action: {
                isAddingMood = true
            }) {
                Text("LOG MY MOOD")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding([.horizontal, .bottom])
            .sheet(isPresented: $isAddingMood) {
                AddMoodView(isPresented: $isAddingMood)
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    MoodLogView()
        .environmentObject(MoodViewModel())
}

