//
//  WeatherDetailsView.swift
//  Weather
//
//  Created by Péter Sanyó on 21.12.23.
//

import SwiftUI

struct WeatherDetailsView: View {
    let tintColor: Color

    let residueType: Storm.Contents
    let residueStrength: Double

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ResidueView(type: residueType, strength: residueStrength)
                    .frame(height: 62)
                    .offset(y: 30) // leaving 2 pixels to look like resting on top of the Rectangle
                    .zIndex(1)

                RoundedRectangle(cornerRadius: 25)
                    .fill(tintColor.opacity(0.25))
                    .frame(height: 800)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal, 20)
            }
            .padding(.top, 200)
        }
    }
}

#Preview {
    WeatherDetailsView(tintColor: .blue, residueType: .snow, residueStrength: 200)
        .background(.black)
}
