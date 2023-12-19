//
//  Color-Interpolation.swift
//  Weather
//
//  Created by Péter Sanyó on 19.12.23.
//

import SwiftUI

extension Color {
    /// reading individual color components from UI Color
    /// have to use rgba here for interpolating consistency
    func getComponents() -> (red: Double, green: Double, blue: Double, alpha: Double) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let uiColor = UIColor(self)
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }

    
    func interpolated(to other: Color, amount: Double) -> Color {
        let componentsFrom = self.getComponents()
        let componentsTo = other.getComponents()

        /// calculate interpolated color value
        let newRed = (1.0 - amount) * componentsFrom.red + (amount * componentsTo.red)
        let newGreen = (1.0 - amount) * componentsFrom.green + (amount * componentsTo.green)
        let newBlue = (1.0 - amount) * componentsFrom.blue + (amount * componentsTo.blue)
        let newOpacity = (1.0 - amount) * componentsFrom.alpha + (amount * componentsTo.alpha)

        return Color(.displayP3, red: newRed, green: newGreen, blue: newBlue, opacity: newOpacity)
    }
}
