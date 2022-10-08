//
//  head.swift
//  The Android Guy
//
//  Created by LouisLin on 2021/11/21.
//

import SwiftUI
struct TAG: Shape {
    func path(in rect: CGRect) -> Path {
        let center: CGPoint = CGPoint(x: rect.midX, y:rect.maxY)
        let radius: CGFloat = min(rect.size.width, rect.size.height) / 2
        
        var circlePath = Path()
        circlePath.addArc(center: center,
                          radius: radius,
                          startAngle: Angle(degrees: 0),
                          endAngle: Angle(degrees: 180),
                          clockwise: true )
        
        var lefteye = Path()
        lefteye.addArc(center: CGPoint(x: rect.minX, y:rect.minY),
                       radius: radius,
                       startAngle: Angle(degrees: 0),
                       endAngle: Angle(degrees: 360),
                       clockwise: true )
        
        var righteye = Path()
        righteye.addArc(center: CGPoint(x: rect.maxX, y:rect.minY),
                       radius: radius,
                       startAngle: Angle(degrees: 0),
                       endAngle: Angle(degrees: 360),
                       clockwise: true )
        
        var path = Path()
        path.addPath(lefteye)
        path.addPath(circlePath)
        path.addPath(righteye)
        return path
    }
}
