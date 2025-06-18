//
//  AddFoodSpotView.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI
import FirebaseAuth

struct AddFoodSpotView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: FoodSpotViewModel

    @State private var name: String = ""
    @State private var location: String = ""
    @State private var description: String = ""
    @State private var category: String = "None"
    @State private var visited: Bool = false
    @State private var rating: Int = 3

    private let categories = ["None", "Chinese", "Western", "Japanese", "Indonesian"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("FOOD SPOT INFO")) {
                    TextField("Name", text: $name)
                    TextField("Location Details", text: $location)
                    TextField("Description", text: $description)

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
                                        .foregroundColor(i <= rating ? .yellow : .gray)
                                        .onTapGesture {
                                            rating = i
                                        }
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
                           guard let uid = Auth.auth().currentUser?.uid else { return }
                           let newSpot = FoodSpotModel(
                              id: UUID().uuidString,
                               userId: uid,
                                name: name,
                                location: location,
                                description: description,
                                category: category == "None" ? "" : category,
                                visited: visited,
                                rating: visited ? rating : nil
                            )
                            viewModel.addFoodSpot(newSpot)
                            dismiss()
                    }
                    .disabled(name.isEmpty || location.isEmpty || description.isEmpty || category == "None")
                }
            }
        }
    }
}

#Preview {
    AddFoodSpotView(viewModel: FoodSpotViewModel())
}
