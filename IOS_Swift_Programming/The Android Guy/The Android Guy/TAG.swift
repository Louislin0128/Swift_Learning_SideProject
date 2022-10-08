//
//  TAG.swift
//  The Android Guy
//
//  Created by LouisLin on 2021/11/21.
//

import SwiftUI
struct TAG: Shape {
    func path(in rect: CGRect) -> Path {
        let center: CGPoint = CGPoint(x: rect.midX, y:rect.midY)
        let radius: CGFloat = min(rect.size.width, rect.size.height) / 2

        var bodysquare = Path()
        bodysquare.move(to: CGPoint(x: center.x - radius * 0.5, y: center.y - radius * 0.3))
        bodysquare.addLine(to: CGPoint(x: center.x - radius * 0.5, y: center.y + radius * 0.45))
        bodysquare.addQuadCurve(to: CGPoint(x: center.x - radius * 0.35, y: center.y + radius * 0.55),
                                control: CGPoint(x: center.x - radius * 0.45, y: center.y + radius * 0.55))
        bodysquare.addLine(to: CGPoint(x: center.x - radius * 0.3, y: center.y + radius * 0.55))
        bodysquare.addLine(to: CGPoint(x: center.x - radius * 0.3, y: center.y + radius * 0.7))             //leg l 弧線
        bodysquare.addQuadCurve(to: CGPoint(x: center.x - radius * 0.1875, y: center.y + radius * 0.9),
                                control: CGPoint(x: center.x - radius * 0.3, y: center.y + radius * 0.9))
        bodysquare.addQuadCurve(to: CGPoint(x: center.x - radius * 0.075, y: center.y + radius * 0.7),
                                control: CGPoint(x: center.x - radius * 0.075, y: center.y + radius * 0.9))
        bodysquare.addLine(to: CGPoint(x: center.x - radius * 0.075, y: center.y + radius * 0.55))
        bodysquare.addLine(to: CGPoint(x: center.x + radius * 0.075, y: center.y + radius * 0.55))
        bodysquare.addLine(to: CGPoint(x: center.x + radius * 0.075, y: center.y + radius * 0.7))           //leg r 弧線
        bodysquare.addQuadCurve(to: CGPoint(x: center.x + radius * 0.1875, y: center.y + radius * 0.9),
                                control: CGPoint(x: center.x + radius * 0.075, y: center.y + radius * 0.9))
        bodysquare.addQuadCurve(to: CGPoint(x: center.x + radius * 0.3, y: center.y + radius * 0.7),
                                control: CGPoint(x: center.x + radius * 0.3, y: center.y + radius * 0.9))
        bodysquare.addLine(to: CGPoint(x: center.x + radius * 0.3, y: center.y + radius * 0.55))
        bodysquare.addLine(to: CGPoint(x: center.x + radius * 0.35, y: center.y + radius * 0.55))
        bodysquare.addQuadCurve(to: CGPoint(x: center.x + radius * 0.5, y: center.y + radius * 0.45),
                                control: CGPoint(x: center.x + radius * 0.5, y: center.y + radius * 0.55))
        bodysquare.addLine(to: CGPoint(x: center.x + radius * 0.5, y: center.y - radius * 0.3))
        
        var lhand = Path()
        lhand.move(to: CGPoint(x: center.x - radius * 0.8, y: center.y - radius * 0.25))
        lhand.addLine(to: CGPoint(x: center.x - radius * 0.8, y: center.y + radius * 0.3))
        lhand.addQuadCurve(to: CGPoint(x: center.x - radius * 0.55, y: center.y + radius * 0.3),
                           control: CGPoint(x: center.x - radius * 0.675, y: center.y + radius * 0.45))
        lhand.addLine(to: CGPoint(x: center.x - radius * 0.55, y: center.y - radius * 0.25))
        lhand.addQuadCurve(to: CGPoint(x: center.x - radius * 0.8, y: center.y - radius * 0.25),
                           control: CGPoint(x: center.x - radius * 0.675, y: center.y - radius * 0.4))
        
        var rhand = Path()
        rhand.move(to: CGPoint(x: center.x + radius * 0.55, y: center.y - radius * 0.25))
        rhand.addLine(to: CGPoint(x: center.x + radius * 0.55, y: center.y + radius * 0.3))
        rhand.addQuadCurve(to: CGPoint(x: center.x + radius * 0.8, y: center.y + radius * 0.3),
                           control: CGPoint(x: center.x + radius * 0.675, y: center.y + radius * 0.45))
        rhand.addLine(to: CGPoint(x: center.x + radius * 0.8, y: center.y - radius * 0.25))
        rhand.addQuadCurve(to: CGPoint(x: center.x + radius * 0.55, y: center.y - radius * 0.25),
                           control: CGPoint(x: center.x + radius * 0.675, y: center.y - radius * 0.4))
        
        var head = Path()
        head.move(to: CGPoint(x: center.x - radius * 0.5, y: center.y - radius * 0.35))
        head.addQuadCurve(to: CGPoint(x: center.x, y: center.y - radius * 0.85),
                          control: CGPoint(x: center.x - radius * 0.5, y: center.y - radius * 0.8))
        head.addQuadCurve(to: CGPoint(x: center.x + radius * 0.5, y: center.y - radius * 0.35),
                          control: CGPoint(x: center.x + radius * 0.5, y: center.y - radius * 0.8))
        
        var leftantennae = Path()
        leftantennae.move(to: CGPoint(x: center.x - radius * 0.25, y: center.y - radius * 0.781))
        leftantennae.addLine(to: CGPoint(x: center.x - radius * 0.35, y: center.y - radius * 0.95))
        leftantennae.addQuadCurve(to: CGPoint(x: center.x - radius * 0.32, y: center.y - radius * 0.96),
                                  control: CGPoint(x: center.x - radius * 0.34, y: center.y - radius * 0.98))
        leftantennae.addLine(to: CGPoint(x: center.x - radius * 0.22, y: center.y - radius * 0.8))
        
        var rightantennae = Path()
        rightantennae.move(to: CGPoint(x: center.x + radius * 0.25, y: center.y - radius * 0.786))
        rightantennae.addLine(to: CGPoint(x: center.x + radius * 0.35, y: center.y -  radius * 0.95))
        rightantennae.addQuadCurve(to: CGPoint(x: center.x + radius * 0.32, y: center.y - radius * 0.96),
                                   control: CGPoint(x: center.x + radius * 0.34, y: center.y - radius * 0.98))
        rightantennae.addLine(to: CGPoint(x: center.x + radius * 0.22, y: center.y - radius * 0.799))
        
        var path = Path()
        path.addPath(bodysquare)
        path.addPath(lhand)
        path.addPath(rhand)
        path.addPath(head)
        path.addPath(leftantennae)
        path.addPath(rightantennae)
        return path
    }
}
