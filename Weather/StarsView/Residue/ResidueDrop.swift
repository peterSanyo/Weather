//
//  ResidueDrop.swift
//  Weather
//
//  Created by Péter Sanyó on 21.12.23.
//

import SwiftUI

class ResidueDrop {
    var destructionTime: Double
    var x: Double
    var y = 0.5
    var scale: Double
    var speed: Double
    var opacity: Double
    var xMovement: Double
    var yMovement: Double

    // Initialize a new ResidueDrop with specified characteristics.
    init(type: Storm.Contents, xPosition: Double, destructionTime: Double) {
        self.x = xPosition
        self.destructionTime = destructionTime

        switch type {
        case .snow:
            scale = Double.random(in: 0.125...0.75)
            opacity = Double.random(in: 0.2...0.7)
            speed = 0

            xMovement = 0
            yMovement = 0
        default:
            scale = Double.random(in: 0.4...0.5)
            opacity = Double.random(in: 0...0.3)
            speed = 2

            // Calculate the x and y components of the movement based on a random direction.
            // This simulates the angle at which rain might fall due to wind.
            let direction = Angle.degrees(.random(in: 225...315)).radians
            xMovement = cos(direction)
            yMovement = sin(direction) / 1.5
        }
    }
}
