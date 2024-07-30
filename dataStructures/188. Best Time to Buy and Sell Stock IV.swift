//
//  188. Best Time to Buy and Sell Stock IV.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 24.7.2024.
//

import Foundation


// WARN: Time Limit Exceeded
//func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
//    let count = prices.count
//    var dic = [String: Int]()
//    func dp(_ i: Int, _ j: Int, _ kk: Int) -> Int {
//        if kk >= k {
//            return 0
//        }
//        if i >= count || j >= count {
//            return 0
//        }
//
//        let key = "\(i)-\(j)-\(kk)"
//        if let cache = dic[key] {
//            return cache
//        }
//
//        if prices[j] > prices[i] {
//            dic[key] = max(dp(i, j + 1, kk), dp(i + 1, j + 1, kk), dp(j + 1, j + 2, kk + 1) + (prices[j] - prices[i]))
//        } else {
//            dic[key] = max(dp(i, j + 1, kk), dp(i + 1, j + 1, kk))
//        }
//
//        return dic[key]!
//    }
//
//    let res = dp(0, 1, 0)
//
//    return res
//}

// SUBMITED SLOW (Dictionary cache)

//func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
//    let count = prices.count
//    var dic = [String: Int]()
//
//    func dp(_ i: Int, _ canSold: Bool, _ kk: Int) -> Int {
//        if kk <= 0 {
//            return 0
//        }
//
//        if i >= count {
//            return 0
//        }
//
//        let key = "\(i)-\(canSold)-\(kk)"
//        if let cache = dic[key] {
//            return cache
//        }
//
//        let skip = dp(i + 1, canSold, kk)
//        if canSold {
//            dic[key] = max(dp(i + 1, !canSold, kk - 1) + prices[i], skip)
//        } else {
//            dic[key] = max(dp(i + 1, !canSold, kk) - prices[i], skip)
//        }
//
//        return dic[key]!
//    }
//
//    return dp(0, false, k)
//}


// SUBMITED  Still SLOW, but works better with Array cache
//func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
//    let count = prices.count
//    var cache = Array(repeating: Array(repeating: Array(repeating: -1, count: k + 1), count: 2), count: count)
//
//    func dp(_ i: Int, _ canSold: Bool, _ kk: Int) -> Int {
//        if kk <= 0 {
//            return 0
//        }
//
//        if i >= count {
//            return 0
//        }
//
//        if cache[i][canSold ? 0 : 1][kk] != -1 {
//            return cache[i][canSold ? 0 : 1][kk]
//        }
//
//        let skip = dp(i + 1, canSold, kk)
//        if canSold {
//            cache[i][canSold ? 0 : 1][kk] = max(dp(i + 1, !canSold, kk - 1) + prices[i], skip)
//        } else {
//            cache[i][canSold ? 0 : 1][kk] = max(dp(i + 1, !canSold, kk) - prices[i], skip)
//        }
//
//        return cache[i][canSold ? 0 : 1][kk]
//    }
//
//    return dp(0, false, k)
//}

// IMAO, it's insane to give someone that during an interview
func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    let count = prices.count
    var arr = Array(
        repeating: Array(
            repeating: Array(
                repeating: 0, count: k + 1
            ), count: 2
        ), count: count + 1
    )
    
    var priceIdx = count - 1
    
    while priceIdx >= 0 {
        var remainIdx = 1
        
        while remainIdx <= k {
            for holding in 0..<2 {
                var ans = arr[priceIdx + 1][holding][remainIdx]
                if holding == 1 {
                    ans = max(ans, prices[priceIdx] + arr[priceIdx + 1][0][remainIdx - 1])
                } else {
                    ans = max(ans, -prices[priceIdx] + arr[priceIdx + 1][1][remainIdx])
                }
                
                arr[priceIdx][holding][remainIdx] = ans
            }
            remainIdx += 1
        }
        
        priceIdx -= 1
    }
    
    return arr[0][0][k]
}

//print(maxProfit(2, [1,2,4]))
//
//print(maxProfit(2, [0,8,5,7,4,7]))
//print(maxProfit(2, [3,2,6,5,0,3]))
