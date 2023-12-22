//
//  SunView.swift
//  Weather
//
//  Created by Péter Sanyó on 22.12.23.
//

import SwiftUI

struct SunView: View {
    let progress: Double
    
    var sunX: Double {
        (progress - 0.3) * 1.8
    }

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("halo")
                    .blur(radius: 3)
                Image("sun")
                    .blur(radius: 2)
                
                VStack {
                    Spacer()
                        .frame(height: 200)

                    ForEach(0..<3) { i in
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 16 + Double(i * 10), height: 16 + Double(i * 10))
                            .padding(.top, 40)
                            .blur(radius: 1)
                    }
                }
            }
            .blendMode(.screen)
            .position(x: geo.frame(in: .global).width * sunX, y: 50)
            .rotationEffect(.degrees((progress - 0.5) * 180))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SunView(progress: 0.5)
}
