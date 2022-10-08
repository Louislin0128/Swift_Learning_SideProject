//
//  TAGView.swift
//  The Android Guy
//
//  Created by LouisLin on 2021/12/9.
//

import SwiftUI

struct TAGView: View {
    var trigger:Bool
    var body: some View {
        ZStack{
            if trigger != true{
                TAG()
            }else{
                TAG_Active()
            }
            eyes().foregroundColor(.white)
        }
    }
}

//struct TAGView_Previews: PreviewProvider {
//    static var previews: some View {
//        TAGView()
//    }
//}
