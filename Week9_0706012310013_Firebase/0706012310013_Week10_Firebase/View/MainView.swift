//
//  MainView.swift
//  0706012310013_Week10_Firebase
//
//  Created by student on 02/05/25.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var foodSpotViewModel: FoodSpotViewModel
    @State private var showAddSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(foodSpotViewModel.foodSpots) { spot in
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

                        Text(spot.description)
                            .font(.body)

                        Text(spot.location)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 8)
                    .swipeActions {
                        Button(role: .destructive) {
                            foodSpotViewModel.deleteFoodSpot(spot)
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
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddFoodSpotView(viewModel: foodSpotViewModel)
            }
            .onAppear {
                foodSpotViewModel.fetchFoodSpots()
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AuthViewModel())
        .environmentObject(FoodSpotViewModel())
}
