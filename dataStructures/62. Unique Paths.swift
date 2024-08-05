//
//  62. Unique Paths.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 5.8.2024.
//

import Foundation

// bottom up
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var mock = Array(repeating: Array(repeating: 1, count: n), count: m)
    
    for i in 1..<m {
        for j in 1..<n {
            mock[i][j] = mock[i - 1][j] + mock[i][j - 1]
        }
    }
    
    return mock[m - 1][n - 1]
}
//func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    var cache = Array(repeating: Array(repeating: -1, count: m), count: n)
//    func dp(_ r: Int, _ d: Int) -> Int {
//        if r == 0 && d == 0 {
//            return 1
//        }
//
//        if r < 0  || d < 0 {
//            return 0
//        }
//
//        if cache[r][d] != -1 {
//            return cache[r][d]
//        }
//
//        cache[r][d] = dp(r - 1, d) + dp(r, d - 1)
//
//        return cache[r][d]
//    }
//
//    return dp(n - 1, m - 1)
//}

//func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    var cache = Array(repeating: Array(repeating: -1, count: m), count: n)
//    func dp(_ r: Int, _ d: Int) -> Int {
//        if r == n - 1 && d == m - 1 {
//            return 1
//        }
//
//        if r >= n  || d >= m {
//            return 0
//        }
//
//        if cache[r][d] != -1 {
//            return cache[r][d]
//        }
//
//        cache[r][d] = dp(r + 1, d) + dp(r, d + 1)
//
//        return cache[r][d]
//    }
//
//    return dp(0, 0)
//}

//print(uniquePaths(3, 7))

