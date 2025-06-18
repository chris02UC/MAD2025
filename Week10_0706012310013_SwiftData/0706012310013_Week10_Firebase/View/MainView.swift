//
//  MainView.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    @Environment(\.modelContext) var modelContext
    @Query(sort: \FoodSpotModel.name) var allFoodSpots: [FoodSpotModel]

    @State private var showAddSheet = false

    var body: some View {
        NavigationView {
            List {
                let userSpots = allFoodSpots.filter {
                    $0.userId == authViewModel.user?.uid
                }

                ForEach(userSpots) { spot in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(spot.name)
                                .font(.headline)
                            Spacer()
                            if spot.visited, let rating = spot.rating {
                                HStack(spacing: 2) {
                                    ForEach(0..<5) { i in
                                        Image(systemName: i < rating ? "star.fill" : "star")
                                            .font(.caption)
                                            .foregroundColor(.yellow)
                                    }
                                }
                            } else {
                                Text("Not Rated Yet")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }

                        Text(spot.category)
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(spot.details)
                            .font(.body)

                        Text(spot.location)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 8)
                    .swipeActions {
                        Button(role: .destructive) {
                            modelContext.delete(spot)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Food Spots")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Logout") {
                        authViewModel.signOut()
                    }
                    .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showAddSheet = true } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddFoodSpotView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AuthViewModel())
        .modelContainer(for: [FoodSpotModel.self])
}
