//
//  931. Minimum Falling Path Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 7.8.2024.
//

import Foundation

//func minFallingPathSum(_ matrix: [[Int]]) -> Int {
//    let mxCount = matrix.count
//
//    var cache: [[Int?]] = Array(repeating: Array(repeating: nil, count: mxCount), count: mxCount)
//
//    func dp(_ row: Int, _ col: Int) -> Int {
//        if row >= mxCount {
//            return 0
//        }
//
//        if let value = cache[row][col] {
//            return value
//        }
//
//        var ans = Int.max
//
//        if col > 0 {
//            ans = dp(row + 1, col - 1)
//        }
//
//        if col < mxCount - 1 {
//            ans = min(ans, dp(row + 1, col + 1))
//        }
//
//        cache[row][col] = min(ans, dp(row + 1, col)) + matrix[row][col]
//
//        return cache[row][col]!
//    }
//
//    var ans = Int.max
//    for fc in 0..<mxCount {
//        ans = min(ans, dp(0, fc))
//    }
//    return ans
//}


// Starting from bottom
//func minFallingPathSum(_ matrix: [[Int]]) -> Int {
//    let mxCount = matrix.count
//
//    var cache: [[Int?]] = Array(repeating: Array(repeating: nil, count: mxCount), count: mxCount)
//
//    func dp(_ row: Int, _ col: Int) -> Int {
//        if row < 0 {
//            return 0
//        }
//
//        if let value = cache[row][col] {
//            return value
//        }
//
//        var ans = Int.max
//
//        if col > 0 {
//            ans = dp(row - 1, col - 1)
//        }
//
//        if col < mxCount - 1 {
//            ans = min(ans, dp(row - 1, col + 1))
//        }
//
//        cache[row][col] = min(ans, dp(row - 1, col)) + matrix[row][col]
//
//        return cache[row][col]!
//    }
//
//    var ans = Int.max
//    for fc in 0..<mxCount {
//        ans = min(ans, dp(mxCount - 1, fc))
//    }
//    return ans
//}

func minFallingPathSum(_ matrix: [[Int]]) -> Int {
    let mxCount = matrix.count
    
    var mock = matrix
    
    for row in 1..<mxCount {
        for col in 0..<mxCount {
            var ans = mock[row - 1][col]
            
            if col > 0 {
               ans = min(ans, mock[row - 1][col - 1])
            }
            
            if col < mxCount - 1 {
                ans = min(ans, mock[row - 1][col + 1])
            }
            
            mock[row][col] = ans + matrix[row][col]
        }
    }
    
    return mock[mxCount - 1].min()!
}

//print(minFallingPathSum([[-19,57],[-40,-5]]))
//print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))
