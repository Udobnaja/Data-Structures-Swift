//
//  714. Best Time to Buy and Sell Stock with Transaction Fee.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 1.8.2024.
//

import Foundation

//func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
//    let count = prices.count
//    var cache = Array(repeating: Array(repeating: -1, count: 2), count: count)
//    func dp(_ i: Int, _ hold: Bool) -> Int {
//        if i >= count {
//            return 0
//        }
//        
//        let holdK = hold ? 0 : 1
//        if cache[i][holdK] != -1 {
//            return cache[i][holdK]
//        }
//        
//        let skip = dp(i + 1, hold)
//        
//        if hold {
//            cache[i][holdK] = max(skip, dp(i + 1, false) + prices[i] - fee)
//        } else {
//            cache[i][holdK] = max(skip, dp(i + 1, true) - prices[i])
//        }
//        
//        return cache[i][holdK]
//    }
//    
//    return dp(0, false)
//}

//func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
//    let count = prices.count
//    var cache = Array(repeating: Array(repeating: 0, count: 2), count: count + 1)
//    
//    var i = count - 1
//    while i >= 0 {
//        for hold in 0..<2 {
//            var ans = cache[i + 1][hold]
//            if hold == 0 {
//                ans = max(ans, cache[i + 1][1] - prices[i])
//            } else {
//                ans = max(ans, cache[i + 1][0] + prices[i] - fee)
//            }
//            
//            cache[i][hold] = ans
//        }
//        i-=1
//    }
//
//    return cache[0][0]
//}

// There is another solution just with one loop
func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    var bought = -prices[0]
    var sell = 0

    for i in 1..<prices.count {
        bought = max(bought, sell - prices[i])
        sell = max(sell, bought + prices[i] - fee)
    }
    return sell
}
//print(maxProfit([1,3,2,8,4,9], 2))
//print(maxProfit( [1,3,7,5,10,3], 3))
