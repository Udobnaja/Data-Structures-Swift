//
//  2218. Maximum Value of K Coins From Piles.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 31.7.2024.
//

import Foundation


//func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
//    let pilesCount = piles.count
//    var cache = [[[Int]]]()
//    for pile in piles {
//        cache.append(Array(repeating: Array(repeating: -1, count: k + 1), count: pile.count))
//
//    }
//    func dp (_ i: Int, _ j: Int,  _ remain: Int) -> Int {
//        if remain == 0 {
//            return 0
//        }
//
//        if i >= pilesCount {
//            return 0
//        }
//
//        if j >= piles[i].count {
//            return 0
//        }
//
//        if cache[i][j][remain] != -1 {
//            return cache[i][j][remain]
//        }
//
//        cache[i][j][remain] = max(
//            dp(i + 1, 0, remain - 1) + piles[i][j],
//            dp(i, j + 1, remain - 1) + piles[i][j],
//            dp(i + 1, 0, remain)
//        )
//
//        return cache[i][j][remain]
//    }
//
//    return dp(0, 0, k)
//}

//func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
//    let pilesCount = piles.count
//    var cache = [[Int]]()
//
//    for pile in piles {
//        cache.append(Array(repeating: -1, count: k + 1))
//    }
//
//    func dp(_ i: Int, _ remain: Int) -> Int {
//        if remain <= 0 {
//            return 0
//        }
//
//        if i >= pilesCount {
//            return 0
//        }
//
//        if cache[i][remain] != -1 {
//           return cache[i][remain]
//        }
//
//        let skip = dp(i + 1, remain)
//
//        var ans = skip
//        let minTake = min(remain, piles[i].count)
//        var cur = 0
//        for j in 0..<minTake {
//            cur += piles[i][j]
//            ans = max(ans, dp(i + 1, remain - j - 1) + cur)
//        }
//
//        cache[i][remain] = ans
//
//        return cache[i][remain]
//    }
//
//    return dp(0, k)
//}

func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
    let pilesCount = piles.count
    var arr = Array(repeating: Array(repeating: 0, count: k + 1), count: pilesCount + 1)
    
    var pileIdx = pilesCount - 1
    
    while pileIdx >= 0 {
        for remain in 1...k {
            arr[pileIdx][remain] = arr[pileIdx + 1][remain]
            var cur = 0
            let minTake = min(remain, piles[pileIdx].count)
            for j in 0..<minTake {
                cur += piles[pileIdx][j]
                arr[pileIdx][remain] = max(arr[pileIdx][remain], cur + arr[pileIdx + 1][remain - j - 1])
            }
        }
        pileIdx -= 1
    }
    
    return arr[0][k]
}

//print(maxValueOfCoins([[100],[100],[100],[100],[100],[100],[1,1,1,1,1,1,700]], 7))
//print(maxValueOfCoins([[1,100,3],[7,8,9]], 2))
