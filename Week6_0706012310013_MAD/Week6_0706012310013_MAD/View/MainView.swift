//
//  MainView.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoodLogView()
                .tabItem {
                    Image(systemName: "book.pages.fill")
                    Text("Mood Log")
                }
            
            MonthlyReportView()
                .tabItem {
                    Image(systemName: "chart.bar.horizontal.page.fill")
                    Text("Report")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MoodViewModel())
}
