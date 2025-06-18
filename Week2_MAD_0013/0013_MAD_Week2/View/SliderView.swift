//
//  SliderView.swift
//  0013_MAD_Week2
//
//  Created by student on 27/02/25.
//

import SwiftUI

struct SliderView: View {
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.mint, Color.green]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(width: 310, height: 6)
      
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 20, height: 20)
                        }
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color.gray.opacity(0.8))
                            .frame(width: 12, height: 12)
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 12, height: 12)
    
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color.gray.opacity(0.8))
                            .frame(width: 12, height: 12)
                        
                        Spacer()
                        
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding(.horizontal, 0)
                }
                .frame(width: 330, height: 20)
                
                HStack {
                    Text("0")
                        .font(.caption)
                        .foregroundColor(.black)
                        .frame(width: 40)
                    
                    Spacer()
                    
                    Text("Max")
                        .font(.caption)
                        .foregroundColor(.black)
                        .frame(width: 40)
                }
                .frame(width: 350)
            }
        }
        .padding(.horizontal, 0)
    }
}

#Preview {
    SliderView()
}
