//
//  StarsView.swift
//  Weather
//
//  Created by Péter Sanyó on 20.12.23.
//

import SwiftUI

struct StarsView: View {
    @State var starField = StarField()
    
    var body: some View {
        Canvas { context, size in
            context.addFilter(.blur(radius: 0.3))
            
            for (index, star) in starField.stars.enumerated() {
                let path = Path(ellipseIn: CGRect(x: star.x, y:star.y, width: star.size, height: star.size))
                
                if index.isMultiple(of: 5) {
                    context.fill(path, with: .color(red: 1, green: 0.85, blue: 0.8))
                } else {
                    context.fill(path, with: .color(white: 1))
                }
            }
        }
        .ignoresSafeArea()
        .mask(
            LinearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    StarsView()
}
