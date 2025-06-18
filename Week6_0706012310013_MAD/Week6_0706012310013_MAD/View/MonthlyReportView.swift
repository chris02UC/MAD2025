//
//  MonthlyReportView.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import SwiftUI

struct MonthlyReportView: View {
    @EnvironmentObject var moodViewModel: MoodViewModel
    
    var body: some View {
        VStack(spacing: 0) {

            Text("Monthly Mood Log")
                .font(.system(size: 32, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                .padding(.horizontal)
                .padding(.bottom, 0)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(moodViewModel.groupedMoodsByMonth(), id: \.month) { group in
                        VStack(alignment: .leading, spacing: 8) {
       
                            Text(formatMonth(group.month))
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
          
                            ForEach(group.moods) { mood in
                                MoodCardView(mood: mood)
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }
        }
    }

    private func formatMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    MonthlyReportView()
        .environmentObject(MoodViewModel())
}
