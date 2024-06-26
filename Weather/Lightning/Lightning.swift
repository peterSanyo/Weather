//
//  Lightning.swift
//  Weather
//
//  Created by Péter Sanyó on 21.12.23.
//

import SwiftUI

class Lightning {
    enum LightningState {
        case waiting, striking, fading
    }

    var bolts = [LightningBolt]()
    var state = LightningState.waiting
    var lastUpdate = Date.now

    func update(date: Date, in size: CGSize) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        lastUpdate = date

        switch state {
        case .waiting:
            break

        case .striking:
            let speed = delta * 800
            var hasFinishedStriking = true

            for bolt in bolts {
                guard var lastPoint = bolt.points.last else { continue }

                for _ in 0..<5 {
                    let endX = lastPoint.x + (speed * cos(bolt.angle) + Double.random(in: -10 ... 10))
                    let endY = lastPoint.y - (speed * sin(bolt.angle) + Double.random(in: -10 ... 10))
                    lastPoint = CGPoint(x: endX, y: endY)
                    bolt.points.append(lastPoint)
                }

                if lastPoint.y < size.height {
                    hasFinishedStriking = false

                    if bolts.count < 4, Int.random(in: 0..<100) < 20 {
                        let newAngle = Double.random(in: -.pi / 4 ... .pi / 4) - .pi / 2
                        let newBolt = LightningBolt(start: lastPoint, width: bolt.width * 0.35, angle: newAngle)
                        bolts.append(newBolt)
                    }
                }
            }
            if hasFinishedStriking {
                state = .fading
            }

        case .fading:
            state = .waiting
            bolts.removeAll(keepingCapacity: true)
        }
    }

    func strike() {
        guard bolts.isEmpty else { return }
        state = .striking

        let startPosition = CGPoint(x: 200, y: 0)
        let newBolt = LightningBolt(start: startPosition, width: 5, angle: Angle.degrees(270).radians)
        bolts.append(newBolt)
    }
}
