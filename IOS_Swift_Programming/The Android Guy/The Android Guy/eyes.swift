//
//  eyes.swift
//  The Android Guy
//
//  Created by LouisLin on 2021/11/21.
//

import SwiftUI
struct eyes: Shape {
    func path(in rect: CGRect) -> Path {
        let center: CGPoint = CGPoint(x: rect.midX, y:rect.midY)
        let radius: CGFloat = min(rect.size.width, rect.size.height) / 2
        
        var lefteye = Path()
        lefteye.addArc(center: CGPoint(x: center.x - radius * 0.25, y: center.y - radius * 0.6),
                       radius: radius/20,
                       startAngle: Angle(degrees: 0),
                       endAngle: Angle(degrees: 360),
                       clockwise: true )
        
        var righteye = Path()
        righteye.addArc(center: CGPoint(x: center.x + radius * 0.25, y: center.y - radius * 0.6),
                       radius: radius/20,
                       startAngle: Angle(degrees: 0),
                       endAngle: Angle(degrees: 360),
                       clockwise: true )
        
        var path = Path()
        path.addPath(lefteye)
        path.addPath(righteye)
        return path
    }
}
