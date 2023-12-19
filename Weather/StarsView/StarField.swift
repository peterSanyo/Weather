//
//  StarField.swift
//  Weather
//
//  Created by Péter Sanyó on 20.12.23.
//

import Foundation

struct StarField {
    var stars = [Star]()
    var leftEdge = -50.0
    let rightEdge = 500.0
    
    init() {
        for _ in 1...200 {
            let x = Double.random(in: leftEdge...rightEdge)
            let y = Double.random(in: 0...600)
            let size = Double.random(in: 1...3)
            let star = Star(x: x, y: y, size: size)
            stars.append(star)
        }
    }
    
}
