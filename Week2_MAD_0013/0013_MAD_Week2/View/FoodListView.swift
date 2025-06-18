//
//  FoodListView.swift
//  0013_MAD_Week2
//
//  Created by student on 27/02/25.
//

import SwiftUI

struct FoodListView: View {
    @State var searchExpense = ""
    @State var isAddExpense = false
    
    var body: some View {
        NavigationStack {
            VStack {

                HStack(spacing: 20) {
                    TextField("Search...", text: $searchExpense)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 0.5))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
                            .frame(width: 40, height: 40) 

                        Image(systemName: "line.3.horizontal.decrease")
                            .font(.title2)
                            .foregroundColor(.black.opacity(0.5))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<10, id: \.self) { _ in
                            FoodCardView()
                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding(.top, 12)
                }
                .background(Color(red: 240/255, green: 250/255, blue: 240/255))
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: { isAddExpense = true }) {
                    Text("Add Expense")
                }
            }
            .navigationDestination(isPresented: $isAddExpense) {
                AddNewExpenseView()
            }
        }
    }
}

#Preview {
    FoodListView()
}

