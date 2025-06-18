//
//  AddFoodSpotView.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI
import SwiftData
import FirebaseAuth

struct AddFoodSpotView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var name: String = ""
    @State private var location: String = ""
    @State private var details: String = ""
    @State private var category: String = "None"
    @State private var visited: Bool = false
    @State private var rating: Int = 3

    private let categories = ["None", "Chinese", "Western", "Japanese", "Indonesian"]

    var body: some View {
        NavigationView {
            Form {
                Section("FOOD SPOT INFO") {
                    TextField("Name", text: $name)
                    TextField("Location Details", text: $location)
                    TextField("Description", text: $details)

                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat).tag(cat)
                        }
                    }
                    .pickerStyle(.menu)

                    Toggle("Visited", isOn: $visited)

                    if visited {
                        HStack {
                            Text("How was the food there?")
                            Spacer()
                            HStack(spacing: 4) {
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: i <= rating ? "star.fill" : "star")
                                        .font(.title3)
                                        .onTapGesture { rating = i }
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Add Food Spot")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        guard let uid = authViewModel.user?.uid else { return }
                        let newSpot = FoodSpotModel(
                            userId: uid,
                            name: name,
                            location: location,
                            details: details,
                            category: category == "None" ? "" : category,
                            visited: visited,
                            rating: visited ? rating : nil
                        )
                        modelContext.insert(newSpot)
                        dismiss()
                    }
                    .disabled(
                        name.isEmpty ||
                        location.isEmpty ||
                        details.isEmpty ||
                        category == "None"
                    )
                }
            }
        }
    }
}

#Preview {
    // Provide a dummy ModelContext for previews
    AddFoodSpotView()
        .environmentObject(AuthViewModel())
        .modelContainer(for: [FoodSpotModel.self])
}
