//
//  GameBoardView.swift
//  my2048
//
//  Created by chasel on 2021/12/22.
//

import SwiftUI
import MGFlipView

struct GameBoardView: View {
    
    @ObservedObject var viewModel: ViewModel
    @Binding var Flip: Bool
    @State var FlipDirect: FlipAxis = .x
    var FlipSpeed: CGFloat
    
    let BoardColor = Color(red:186/255, green:155/255, blue:125/255)
    let BaseTileColor = Color(red:240/255, green:220/255, blue:204/255)
    
    @ViewBuilder
    var body: some View {
        GeometryReader{ rect in
            let s = min(rect.size.width, rect.size.height) * 0.9
            ZStack{ 
                VStack{
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: s / 4), spacing: 0)],
                        spacing: 0,
                        content: {
                            let A = viewModel.front
                            let B = viewModel.back
                            let N = ViewModel.N
                            ForEach(0..<N){ x in
                                ForEach(0..<N){ y in
                                    Tile(front: A[x][y], back: B[x][y])
                                        .aspectRatio(1.0, contentMode: .fit)
                                }
                            }
                        }
                    )
                }
            }.frame(width: s, height: s)
             .position(x: rect.size.width / 2, y: rect.size.height / 2 - 50)
        }.gesture(pan)
    }
    
    @Binding var GameOver: Bool
    private var pan: some Gesture{
        let swipeRange = 50.0
        return DragGesture()
            .onEnded { value in
                let vector = value.translation
                var direct: String = ""
                if abs(vector.height) < CGFloat(swipeRange) {
                    if vector.width > 0 {
                        FlipDirect = .y; direct = "right"
                    }
                    else {
                        FlipDirect = .custom(x: 0, y: -1); direct = "left"
                    }
                    GameOver = viewModel.move(Flip: !Flip, direct: direct)
                    Flip.toggle()
                }
                else if abs(vector.width) <  CGFloat(swipeRange)  {
                    if vector.height < 0 {
                        FlipDirect = .x; direct = "up"
                    }
                    else {
                        FlipDirect = .custom(x: -1, y: 0); direct = "down"
                    }
                    GameOver = viewModel.move(Flip: !Flip, direct: direct)
                    Flip.toggle()
                }
                print(direct)
            }
    }
    
    func scalar(rect: CGSize) -> CGFloat{
        print("w: \(rect.width), h: \(rect.height)")
        
        return 0.9
    }
    
    private func Tile(front: Int, back: Int) -> some View{
        return GeometryReader{ rect in
            let A = { setText(t: front, r: rect.size) }
            let B = { setText(t: back,  r: rect.size) }
            FlipView(frontView: A,
                     backView:  B,
                     flipped: $Flip,
                     flipAxis: FlipDirect,
                     animation: .init(type: getAnimationType(), duration: Double(FlipSpeed))
            )
        }
    }
     
    private func setText(t: Int, r: CGSize) -> some View{
        let size = min(r.width, r.height) * 0.8
        let text: String = t == 0 ? "": String(t) 
        var fontSize: CGFloat
        switch t {
            case 1...128: fontSize = 32
            case 256...9128: fontSize = 24
            default: fontSize = 16
        }
        
        var color: Color
        switch t {
            case 0:       color = Color(hex: 0xd5f2e3)
            case 2...4:   color = Color(hex: 0xcbe896)
            case 8...16:  color = Color(hex: 0xe4d085)
            case 32...64: color = Color(hex: 0xfcb873)
            case 128:     color = Color(hex: 0xf8a170)
            case 256:     color = Color(hex: 0xf1736a)
            case 512:     color = Color(hex: 0xe3175e)
            case 1024:    color = Color(hex: 0xd83682)
            default:      color = Color(hex: 0xcc54a5)
        }
        
        return Text(text).font(.system(size: fontSize))
                         .frame(width: size, height: size)
                         .background(color)
                         .cornerRadius(10)
                         .position(x: r.width / 2 , y: r.height / 2)
    }
      
    private func getAnimationType() -> AnimationType{
        return .easeOut
    }
}
