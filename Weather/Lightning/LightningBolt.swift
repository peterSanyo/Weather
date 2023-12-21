//
//  LightningBolt.swift
//  Weather
//
//  Created by Péter Sanyó on 21.12.23.
//

import SwiftUI

class LightningBolt {
    var points = [CGPoint]()
    var width: Double
    var angle: Double

    init(start: CGPoint, width: Double, angle: Double) {
        points.append(start)
        self.width = width
        self.angle = angle
    }
}
