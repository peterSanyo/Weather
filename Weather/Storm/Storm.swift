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
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        
        lastUpdate = date
    }
}
