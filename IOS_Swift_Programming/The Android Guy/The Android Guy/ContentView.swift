//
//  ContentView.swift
//  The Android Guy
//
//  Created by LouisLin on 2021/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var trigger = false
    
    var body: some View {
        VStack{
            ZStack{
                TAGView(trigger: trigger).offset(panOffset)
            }
            .foregroundColor(Color(red: 164/255, green: 198/255, blue: 57/255))
            .scaleEffect(zoomScale)
            .onTapGesture {
                self.trigger.toggle()
            }
            .background(Color.white)
            
            HStack{
                Spacer()
                play
                Spacer()
                Center
                Spacer()
                Unit_Size
                Spacer()
            }
            .font(.largeTitle)
            Spacer()
            HStack{
                Text("")
            }
        }
        .gesture(pinch.simultaneously(with: pan))
        .background(Color(red: 245/255, green: 173/255, blue: 10/255))
        .ignoresSafeArea()
    }
    
    //拖曳畫面
    @State private var steadystatePanOffset: CGSize = .zero
    @GestureState private var gesturePanOffset: CGSize = .zero
    private var panOffset: CGSize{
        steadystatePanOffset + gesturePanOffset
    }
    private var pan: some Gesture{
        DragGesture()
            .updating($gesturePanOffset){ (latestGestureValue , gesturePanOffset, _) in gesturePanOffset = latestGestureValue.translation
            }
            .onEnded{(finalGestureValue) in steadystatePanOffset = steadystatePanOffset + finalGestureValue.translation }
    }
    //兩隻手指抓住
    @State private var steadystateZoomScale:CGFloat = 1.0
    @GestureState private var gestureZoomScale: CGFloat = 1.0
    private var zoomScale: CGFloat{
        steadystateZoomScale * gestureZoomScale
    }
    private var pinch: some Gesture{
        MagnificationGesture()
            .updating($gestureZoomScale){ (latestGestureScale , gestureZoomScale, _) in gestureZoomScale = latestGestureScale }
            .onEnded{(finalGestureScale) in steadystateZoomScale *= finalGestureScale}
    }
    var play :some View{
        Button(action: {
            
        }, label: {
            VStack{
                Image(systemName: "play.circle")
                Text("Play").font(.footnote)
            }
        })
    }
    var Center: some View{
        Button(action: {
            
        }, label: {
            VStack{
                Image(systemName: "viewfinder.circle")
                Text("Center").font(.footnote)
            }
        })
    }
    var Unit_Size: some View{
        Button(action: {
            
        }, label: {
            VStack{
                Image(systemName: "1.circle")
                Text("Unit Size").font(.footnote)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
