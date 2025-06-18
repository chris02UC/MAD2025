//
//  CategorySelectionView.swift
//  0013_MAD_Week2
//
//  Created by student on 27/02/25.
//

import SwiftUI

// Category Selection View
struct CategorySelectionView: View {
    
    
    @Binding var selectedCategory: String
    let categories: [String]
    
    var body: some View {
        List {
            ForEach(categories, id: \.self) { category in
                Button(action: {
                    selectedCategory = category
                }) {
                    HStack {
                        Text(category)
                        Spacer()
                        if selectedCategory == category {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .foregroundColor(.black)
            }
        }
        .navigationTitle("Select Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}
