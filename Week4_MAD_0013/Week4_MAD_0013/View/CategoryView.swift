//
//  CategoryView.swift
//  Week4_MAD_0013
//
//  Created by student on 13/03/25.
//

import SwiftUI

struct CategoryView: View {
    
    // Two-column grid layout
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {

                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        // Electronics
                        NavigationLink(destination: ElectronicsView()) {
                            CategoryItemView(
                                icon: "iphone",
                                color: .blue,
                                title: "Electronics",
                                subtitle: "Latest gadgets and devices"
                            )
                        }
                        
                        // Clothing
                        NavigationLink(destination: ClothingView()) {
                            CategoryItemView(
                                icon: "tshirt",
                                color: .purple,
                                title: "Clothing",
                                subtitle: "Newest Fashion and wearables"
                            )
                        }
                        
                        // Home
                        NavigationLink(destination: HomeView()) {
                            CategoryItemView(
                                icon: "house",
                                color: .green,
                                title: "Home",
                                subtitle: "Furniture and home appliances"
                            )
                        }
                        
                        // Sports
                        NavigationLink(destination: SportsView()) {
                            CategoryItemView(
                                icon: "football",
                                color: .red,
                                title: "Sports",
                                subtitle: "Sports and fitness equipment"
                            )
                        }
                    }
                    .padding(16)
                }
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoryView()
}
