//
//  StarField.swift
//  Weather
//
//  Created by Péter Sanyó on 20.12.23.
//

import Foundation

class StarField {
    var stars = [Star]()
    var leftEdge = -50.0
    let rightEdge = 500.0
    var lastUpdate = Date.now
    
    init() {
        for _ in 1...200 {
            let x = Double.random(in: leftEdge...rightEdge)
            let y = Double.random(in: 0...600)
            let size = Double.random(in: 1...3)
            let star = Star(x: x, y: y, size: size)
            stars.append(star)
        }
    }
    
    func update(date: Date) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        
        for star in stars {
            let speedFactor = 1 + star.size / 3 // Speed increases with star size
            star.x -= delta * speedFactor * 2

            if star.x < leftEdge {
                star.x = rightEdge
            }
        }
        lastUpdate = date
    }
}
