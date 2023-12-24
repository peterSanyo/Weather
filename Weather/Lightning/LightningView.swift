//
//  LightningView.swift
//  Weather
//
//  Created by Péter Sanyó on 21.12.23.
//

import SwiftUI

struct LightningView: View {
    var lightning: Lightning

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                lightning.update(date: timeline.date, in: size)

                for bolt in lightning.bolts {
                    var path = Path()
                    path.addLines(bolt.points)
                    context.stroke(path, with: .color(.white), lineWidth: bolt.width)
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            lightning.strike()
        }
    }

    init() {
        lightning = Lightning()
    }
}

#Preview {
    LightningView()
}
