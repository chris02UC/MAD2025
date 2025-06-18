//
//  AddMoodView.swift
//  Week6_0706012310013_MAD
//
//  Created by student on 27/03/25.
//

import SwiftUI

struct AddMoodView: View {
    @EnvironmentObject var moodViewModel: MoodViewModel

    @Binding var isPresented: Bool
    
    @State private var selectedMood: MoodType? = nil
    
    @State private var note: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Daily Mood Entry")
                .font(.system(size: 36, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, -10)
            
            Text("Select your mood:")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack(spacing: 16) {
                moodButton(mood: .happy, label: "😊 Happy")
                moodButton(mood: .neutral, label: "😐 Neutral")
                moodButton(mood: .sad, label: "😢 Sad")
            }
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(height: 100)

                TextEditor(text: $note)
                    .padding(8)
                    .frame(height: 100)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            VStack(spacing: 10) {
                Button("Submit") {
                    if let selected = selectedMood {
                        moodViewModel.addMood(mood: selected, note: note)
                    }
                    isPresented = false
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)

                .background(selectedMood == nil ? Color.gray : Color.blue)
                .cornerRadius(8)
                .disabled(selectedMood == nil)

                Button("Cancel") {
                    isPresented = false
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                .padding(.bottom, 10)
                
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 1)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 20)
    }
    
    private func moodButton(mood: MoodType, label: String) -> some View {
        Button {
            selectedMood = mood
        } label: {
            Text(label)
                .font(.system(size: 16))
                .foregroundColor(.blue)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            selectedMood == mood
                            ? Color.gray.opacity(0.4)
                            : Color.gray.opacity(0.2)
                        )
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AddMoodView(isPresented: .constant(true))
        .environmentObject(MoodViewModel())
}
