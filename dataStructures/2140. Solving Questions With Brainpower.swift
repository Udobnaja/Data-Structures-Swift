//
//  2140. Solving Questions With Brainpower.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.7.2024.
//

import Foundation

// TB
//func mostPoints(_ questions: [[Int]]) -> Int {
//    let count = questions.count
//    var answ = 0
//    var arr = Array(repeating: -1, count: count)
//
//    func dp(_ i: Int) -> Int {
//        guard i < count else {
//            return 0
//        }
//
//        if arr[i] == -1 {
//            arr[i] = max(dp(i + questions[i][1] + 1) + questions[i][0], dp(i+1))
//        }
//
//        return arr[i]
//    }
//
//    return dp(0)
//}

// BT
func mostPoints(_ questions: [[Int]]) -> Int {
    let count = questions.count
    var arr = Array(repeating: 0, count: count + 1)
    
    var i = count - 1
    while i >= 0 {
        let j = i + questions[i][1] + 1

        arr[i] = max(questions[i][0] + arr[min(j, count)], arr[i + 1])
        
        i -= 1
    }
      
    return arr[0]
}

//print(mostPoints([[3,2],[4,3],[4,4],[2,5]]))

