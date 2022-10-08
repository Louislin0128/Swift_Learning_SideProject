//
//  source.swift
//  my2048
//
//  Created by chasel on 2021/12/22.
//

import Foundation
import SwiftUI

struct model<Content> where Content: Equatable{
    
    private var N: Int
    private var map = [[Int]]()
    private var Score: Int = 0
    private var highScore: Int = 0
    
    private(set) var first  = [[Int]]()
    private(set) var second = [[Int]]()
    
    func getScore() -> Int { return Score }
    
    func getHighScore() -> Int{ return highScore }
     
    init(BoardSize: Int) {
        N = BoardSize
        for _ in 0..<N{
            var a = [Int]()
            var b = [Int]()
            var c = [Int]()
            for _ in 0..<N {
                a.append(0)
                b.append(0)
                c.append(0)
            }
            map.append(a)
            first.append(b)
            second.append(c)
        }
        RandomIndex(Repeat: 2)
        copyMap(Flip: false)
    }
    
    mutating func resetBoardModel(flip: Bool) {
        Score = 0
        for i in 0..<N {
            for j in 0..<N {
                map[i][j] = 0
            }
        }
        RandomIndex(Repeat: 2)
        copyMap(Flip: flip)
    }
    
    mutating func copyMap(Flip: Bool){
        if Flip {
            for a in 0..<N{
                for b in 0..<N{
                     second[a][b] = map[a][b]
                }
            }
        }
        else {
            for a in 0..<N{
                for b in 0..<N{
                     first[a][b] = map[a][b]
                }
            }
        }
    }
    //隨機位置產生數字
    mutating func RandomIndex(Repeat: Int){
        var empty = [Int]()
        for i in 0..<N {
            for j in 0..<N {
                if map[i][j] == 0 {
                    empty.append(i * N + j)
                }
            }
        }
        let n = empty.count
        if n != 0 {
            for _ in 1...Repeat{
                let index = Int.random(in: 0..<n)
                let x = empty[index] / N
                let y = empty[index] % N
                map[x][y] = Int.random(in: 1...2) * 2
            }
        }
    }
    
    private mutating func addScore(_ num: Int){
        Score = Score + num
        highScore = Score > highScore ? Score : highScore
    }
    
    private var tmp = [Int]()
    private var merge = true
     
    mutating func Merge(value: Int){
        if tmp.count != 0 {
            if value == tmp.last && merge {
                tmp[tmp.count-1] = value * 2
                addScore(value * 2)
                merge = false
            }else {
                tmp.append(value)
                merge = true
            }
        }else {
            tmp.append(value)
        }
    }
     
    mutating func isGameOver() -> Bool{
        for i in 0..<N {
            var x = 0
            var y = 0
            for j in 0..<N {
                if map[i][j] == 0 || map[j][i] == 0 {
                    return false
                }
                else{
                    if x != map[i][j] { x = map[i][j] }
                    else { return false }
                    
                    if y != map[j][i] { y = map[j][i] }
                    else { return false }
                }
            }
        }
        return true
    }
    
    
    mutating func MergeRight(){
        for row in 0..<N {
            tmp.removeAll()
            merge = true
            for i in 1...N{
                let col = N - i
                if map[row][col] != 0 {
                    Merge(value: map[row][col])
                    map[row][col] = 0
                }
            }
            for i in tmp.indices {
                map[row][N - i - 1] = tmp[i]
            }
        }
    }
    
    mutating func MergeLeft(){
        for row in 0..<N {
            tmp.removeAll()
            merge = true
            for col in 0..<N{
                if map[row][col] != 0 {
                    Merge(value: map[row][col])
                    map[row][col] = 0
                }
            }
            for i in tmp.indices {
                map[row][i] = tmp[i]
            }
        }
    }
     
    mutating func MergeDown(){
        for col in 0..<N {
            tmp.removeAll()
            merge = true
            for i in 1...N {
                let row = N - i
                if map[row][col] != 0 {
                    Merge(value: map[row][col])
                    map[row][col] = 0
                }
            }
            for i in tmp.indices {
                map[N-i-1][col] = tmp[i]
            }
        }
    }
    
    mutating func MergeUp(){
        for col in 0..<N {
            tmp.removeAll()
            merge = true
            for row in 0..<N {
                if map[row][col] != 0 {
                    Merge(value: map[row][col])
                    map[row][col] = 0
                }
            }
            for i in tmp.indices {
                map[i][col] = tmp[i]
            }
        }
    } 
}
