//
//  Array-GradientStop.swift
//  Weather
//
//  Created by Péter Sanyó on 19.12.23.
//

import SwiftUI

extension Array where Element == Gradient.Stop {
    func interpolated(amount: Double) -> Color {
        self[0].color
    }
}
