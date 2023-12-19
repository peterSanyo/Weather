//
//  CloudsView.swift
//  Weather
//
//  Created by Péter Sanyó on 19.12.23.
//

import SwiftUI

struct CloudsView: View {
    var cloudGroup: CloudGroup
    let topTint: Color
    let bottomTint: Color

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                cloudGroup.update(date: timeline.date)
                context.opacity = cloudGroup.opacity
                
                let resolvedImages = (0..<8).map { i -> GraphicsContext.ResolvedImage in
                    let sourceImage = Image("cloud\(i)")
                    var resolved = context.resolve(sourceImage)
                    
                    resolved.shading = .linearGradient(
                        Gradient(colors: [topTint, bottomTint]),
                        startPoint: .zero,
                        endPoint: CGPoint(x: 0, y: resolved.size.height)
                    )
                    return resolved
                }
                
                for cloud in cloudGroup.clouds {
                    context.translateBy(x: cloud.position.x, y:cloud.position.y)
                    context.scaleBy(x: cloud.scale, y: cloud.scale)
                    let cloudImage = "cloud\(cloud.imageNumber)"
                    context.draw(resolvedImages[cloud.imageNumber], at: .zero, anchor:.topLeading)
                    context.transform = .identity
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    init(thickness: Cloud.Thickness, topTint: Color, bottomTint: Color) {
        cloudGroup = CloudGroup(thickness: thickness)
        self.topTint = topTint
        self.bottomTint = bottomTint
    }
}

#Preview {
    CloudsView(thickness: .regular, topTint: .white, bottomTint: .white)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .background(.blue.opacity(0.6))
}
