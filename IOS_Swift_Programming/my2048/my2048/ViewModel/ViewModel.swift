//
//  ViewModel.swift
//  my2048
//
//  Created by chasel on 2021/12/22.
//
import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    
    static let N: Int = 4
    
    @Published private var source = model<String>(BoardSize: N)
    
    var front: [[Int]]{ source.first  }
    var back:  [[Int]]{ source.second }
    var Score: Int { source.getScore() }
    var HighScore: Int { source.getHighScore() }
    
    func move(Flip: Bool, direct: String) -> Bool{
        switch direct {
            case "up":     source.MergeUp()
            case "down":   source.MergeDown()
            case "left":   source.MergeLeft()
            case "right":  source.MergeRight()
            default: print("up or down or left or right")
        }
        source.RandomIndex(Repeat: 1)
        source.copyMap(Flip: Flip)
        return source.isGameOver()
    }
    
    func restartGame(Flip: Bool){
        source.resetBoardModel(flip: Flip)
    }
}
