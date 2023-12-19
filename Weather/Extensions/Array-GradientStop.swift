//
//  Array-GradientStop.swift
//  Weather
//
//  Created by Péter Sanyó on 19.12.23.
//

import SwiftUI

extension Array where Element == Gradient.Stop {
    func interpolated(amount: Double) -> Color { // total amount : 0.2
        guard let initialStop = self.first else {
            fatalError("Attempted to read color from empty stop array.")
        }
        
        var firstStop = initialStop // black 0.1 - PAST: 0.1
        var secondStop = initialStop // white 0.3 - DIFF: 0.2
        
        for stop in self {
            if stop.location < amount {
                firstStop = stop
            } else {
                secondStop = stop
                break
            }
        }
        
        let totalDifference = secondStop.location - firstStop.location
        
        if totalDifference > 0 {
            let relativeDifference = (amount - firstStop.location) / totalDifference
            return firstStop.color.interpolated(to: secondStop.color, amount: relativeDifference)
        } else {
            return firstStop.color.interpolated(to: secondStop.color, amount: 0)
        }
        
        
    }
}
