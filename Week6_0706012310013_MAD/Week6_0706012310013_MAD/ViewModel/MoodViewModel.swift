//
//  MoodViewModel.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import Foundation

class MoodViewModel: ObservableObject {
    @Published var moods: [MoodEntry] = []
    
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy H.mm"

        let date1 = formatter.date(from: "21/03/2025 8.00") ?? Date()
        let date2 = formatter.date(from: "21/03/2025 20.00") ?? Date()
        
        let date3 = formatter.date(from: "20/03/2025 12.00") ?? Date()
        let date4 = formatter.date(from: "20/03/2025 15.00") ?? Date()
        let date5 = formatter.date(from: "15/03/2025 10.30") ?? Date()
        
        // Different months (February & January)
        let date6 = formatter.date(from: "28/02/2025 17.00") ?? Date()
        let date7 = formatter.date(from: "28/02/2025 20.00") ?? Date()
        let date8 = formatter.date(from: "05/02/2025 9.15") ?? Date()
        let date9 = formatter.date(from: "10/01/2025 14.00") ?? Date()
        let date10 = formatter.date(from: "31/01/2025 22.00") ?? Date()
        
        moods = [
            MoodEntry(date: date1, mood: .happy,  note: "Great walk outside!"),
            MoodEntry(date: date2, mood: .sad,    note: "Rough evening."),
            
            MoodEntry(date: date3, mood: .neutral, note: "Just an okay day."),
            MoodEntry(date: date4, mood: .happy,   note: "Had a nice lunch."),
            MoodEntry(date: date5, mood: .sad,     note: "Feeling under the weather."),
            
            MoodEntry(date: date6, mood: .happy,   note: "Finished a big task!"),
            MoodEntry(date: date7, mood: .neutral, note: "Went out for dinner."),
            MoodEntry(date: date8, mood: .sad,     note: "Rained all morning."),

            MoodEntry(date: date9,  mood: .happy,   note: "Got a new job!"),
            MoodEntry(date: date10, mood: .neutral, note: "Relaxing evening.")
        ]
    }
    

    func groupedMoodsByDate() -> [(date: Date, moods: [MoodEntry])] {
        let grouped = Dictionary(grouping: moods) {
            Calendar.current.startOfDay(for: $0.date)
        }
        
        let result = grouped.map { (key: Date, value: [MoodEntry]) in
            (date: key, moods: value)
        }
        
        return result.sorted { $0.date > $1.date }
    }
    
    func addMood(mood: MoodType, note: String) {
        let newEntry = MoodEntry(date: Date(), mood: mood, note: note)
        moods.append(newEntry)
    }
    
    func groupedMoodsByMonth() -> [(month: Date, moods: [MoodEntry])] {

        let grouped = Dictionary(grouping: moods) { moodEntry in
            let comps = Calendar.current.dateComponents([.year, .month], from: moodEntry.date)
            return Calendar.current.date(from: comps) ?? moodEntry.date
        }

        let result = grouped.map { (key: Date, value: [MoodEntry]) in
            (month: key, moods: value)
        }

        return result.sorted { $0.month > $1.month }
    }

}


