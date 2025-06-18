//
//  FoodCardView.swift
//  0013_MAD_Week2
//
//  Created by student on 27/02/25.
//

import SwiftUI

struct FoodCardView: View {
    var body: some View {
        HStack {
 
            ZStack {
                Image(systemName: "fork.knife")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(12)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 11) {

                HStack {
                    Text("Food")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                    Text("75% Need")
                        .font(.caption)
                        .foregroundColor(.black)

                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    Text("25% Want")
                        .font(.caption)
                        .foregroundColor(.black)
                }
                

                HStack {
                    Text("02/19/2025 09:46")
                        .font(.subheadline)
                        .foregroundColor(.blue)

                    Spacer()

                    Text("Rp 50.000")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }

            VStack {
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .padding()
        .frame(height: 80)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 5))
        .padding(.horizontal, 16)
    }
}

#Preview {
    FoodCardView()
}
