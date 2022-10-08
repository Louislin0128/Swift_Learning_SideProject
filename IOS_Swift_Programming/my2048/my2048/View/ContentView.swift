//
//  ContentView.swift
//  my2048
//
//  Created by chasel on 2021/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    @State var Flip: Bool = false
    @State var GameOver: Bool = false
    var body: some View {
        GeometryReader{ rect in
            ZStack{
                LiquidSwipeView(viewModel: viewModel, Flip: $Flip, Show: $show)
            
                VStack{
                    Text("2048").font(.system(size: 60))
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text("Score")
                            Text(String(viewModel.Score))
                        }
                        Spacer()
                        VStack{
                            Text("High Score")
                            Text(String(viewModel.HighScore))
                           
                        }
                        Spacer()
                    }.font(.system(size: 24))
                     .padding(25)
                    Spacer()
                    GameBoardView(viewModel: viewModel,
                                  Flip: $Flip,
                                  FlipSpeed: AnimationSpeed,
                                  GameOver: $GameOver)
                        .gesture(longPress)
                    if show {
                        FlipSpeedControl(w: rect.size.width)
                    }
                }
                if GameOver {
                    ZStack{
                        Rectangle().fill(Color.white).opacity(0.5)
                        Text("Game Over").font(.system(size: 60))
                    }.ignoresSafeArea()
                     .onTapGesture{
                         GameOver = false
                         viewModel.restartGame(Flip: !Flip)
                         Flip.toggle()
                    }
                }
            }
        }.ignoresSafeArea()
    }
    
    @State private var steadyStatePanOffset: CGSize = .zero
    @GestureState private var gesturePanOffset: CGSize = .zero
    
    @State var AnimationSpeed: CGFloat = 1.0
    private func FlipSpeedControl(w: CGFloat) -> some View{
        return VStack {
            Text("翻轉速度：\(String(format: "%.1f", AnimationSpeed))")
            
            Slider(value: $AnimationSpeed, in: 0.2...2.5, step: 0.1) {_ in
            }.frame(width: w * 0.75, height: 50)
        }
        
    }
    
    @State var show: Bool = false
    private var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.5)
            .onEnded({ _ in
                withAnimation{
                    show.toggle()
                }
            })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
