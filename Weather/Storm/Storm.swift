//
//  Storm.swift
//  Weather
//
//  Created by Péter Sanyó on 20.12.23.
//

import SwiftUI

class Storm {
    enum Contents: CaseIterable {
        case none, rain, snow
    }
    
    var drops = [StormDrop]()
    var lastUpdate = Date.now
    var image: Image
    
    init(type: Contents, direction: Angle, strength: Int) {
        switch type {
        case .snow:
            image = Image("snow")
        default:
            image = Image("rain")
        }
        
        for _ in 0..<strength {
            drops.append(StormDrop(type: type, direction: direction + .degrees(90)))
        }
    }
    
    func update(date: Date, size: CGSize) {
        // ensuring movement is smooth over time regardless of frame Rate
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        
        // continous speed, no matter the angle
        let divisor = size.height / size.width
        
        for drop in drops {
            
            let radians = drop.direction.radians // making it possible to trigonometrical calculate new position based on direction (Angle -> radians)
            
            // Update the x position of the drop based on its speed, direction, and time delta.
            drop.x += cos(radians) * drop.speed * delta * divisor // cos(radians) gives the horizontal component of the direction.
            drop.y += sin(radians) * drop.speed * delta * divisor // sin(radians) for the vertical component.

            // Horizontal wrapping
            if drop.x < -0.2 {
                drop.x += 1.4
            }

            // Vertical Wrapping
            if drop.y > 1.2 {
                drop.x = Double.random(in: -0.2...1.2)
                drop.y -= 1.4
            }
            
            // update rotation to give a realistic tumble movement
            drop.rotation += drop.rotationSpeed * delta
        }
        
        // Store the current date as the last update time to calculate the delta in the next update cycle, ensuring consistent and smooth animations.
        lastUpdate = date
    }
}
