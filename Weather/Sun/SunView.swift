//
//  SunView.swift
//  Weather
//
//  Created by Péter Sanyó on 22.12.23.
//

import SwiftUI

struct SunView: View {
    @State private var haloScale = 1.0
    @State private var sunRotation = 0.0
    @State private var flareDistance = 80.0

    let progress: Double

    var sunX: Double {
        (progress - 0.3) * 1.8
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("halo")
                    .blur(radius: 3)
                    .scaleEffect(haloScale)
                    .opacity(sin(progress * .pi) * 3 - 2)

                Image("sun")
                    .blur(radius: 2)
                    .rotationEffect(.degrees(sunRotation))

                VStack {
                    Spacer()
                        .frame(height: 200)

                    ForEach(0 ..< 3) { i in
                        Circle()
                            .fill(.white.opacity(0.2))
                            .frame(width: 16 + Double(i * 10), height: 16 + Double(i * 10))
                            .padding(.top, 40 + (sin(Double(i) / 2) * flareDistance))
                            .blur(radius: 2)
                            .opacity(sin(progress * .pi) - 0.7)
                    }
                }
            }
            .blendMode(.screen)
            .onAppear {
                withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) {
                    haloScale = 1.3
                }

                withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                    sunRotation = 20
                }

                withAnimation(.easeInOut(duration: 30).repeatForever(autoreverses: true)) {
                    flareDistance = -70
                }
            }
            .position(x: geo.frame(in: .global).width * sunX, y: 50)
            .rotationEffect(.degrees((progress - 0.5) * 180))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SunView(progress: 0.5)
}
