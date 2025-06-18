//
//  AddNewExpenseView.swift
//  0013_MAD_Week2
//
//  Created by student on 27/02/25.
//

import SwiftUI

struct AddNewExpenseView: View {
    @State private var selectedCategory = "Food"
    
    
    
    let categories = ["Food", "Transport", "Entertainment", "Shopping", "Bills"]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    Text("Category")
                        .font(.headline)
                    Spacer()
    
                    NavigationLink(destination: CategorySelectionView(selectedCategory: $selectedCategory, categories: categories)) {
                                       HStack(spacing: 4) {
                            Text(selectedCategory)
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)

                // Date Field
                VStack(alignment: .leading) {
                    Text("Date")
                        .font(.headline)
                    
                    TextField("02/25/2025", text: .constant(""))
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                        .foregroundColor(.black)
                        .placeholder(when: true) {
                            Text("02/25/2025")
                                .foregroundColor(.gray)
                        }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)

                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Text("Expenditure")
                                .font(.headline)
                            Spacer()
                            Text("Rp 0 - Max")
    
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    
                    SliderView()
                        .padding(.horizontal, 25)
                }//note: HIG Violation here, Expenditure dont use slider

                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Text("Necessity")
                                .font(.headline)
                            Spacer()
                            Text("0 - 100 %")
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    
                    SliderView()
                        .padding(.horizontal, 25)
                }

                // Done Button
                Button(action: {}) {
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 240, height: 40)
                        .background(Color(.sRGB, red: 0, green: 0.5, blue: 0, opacity: 1))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity) 
                .padding(.top, 24)

                Spacer()
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}

#Preview {
    AddNewExpenseView()
}
