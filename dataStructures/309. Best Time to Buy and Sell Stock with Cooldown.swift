//
//  309. Best Time to Buy and Sell Stock with Cooldown.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 2.8.2024.
//

import Foundation

//func maxProfit(_ prices: [Int]) -> Int {
//    let count = prices.count
//    var cache = Array(repeating: Array(repeating: -1, count: 3), count: count)
//    func dp(_ i: Int, _ choice: Int) -> Int {
//        if i >= count {
//            return 0
//        }
//        
//        if cache[i][choice] != -1 {
//            return cache[i][choice]
//        }
//        
//        let skip = dp(i + 1, choice == 2 ? 0 : choice)
//        
//        if choice == 0 { // we can buy
//            cache[i][choice] = max(skip, dp(i + 1, 1) - prices[i])
//        } else if  choice == 1 { // we can sell
//            cache[i][choice] = max(skip, dp(i + 1, 2) + prices[i])
//        } else { // we can not buy buy
//            cache[i][choice] = dp(i + 1, 0)
//        }
//        
//        return cache[i][choice]
//    }
//    
//    return dp(0, 0)
//}


func maxProfit(_ prices: [Int]) -> Int {
    let count = prices.count
    var cache = Array(repeating: Array(repeating: 0, count: 2), count: count + 2)
    
    var i = count - 1
    
    while i >= 0 {
        for choice in 0..<2 {
            var ans = cache[i + 1][choice]
            
            if choice == 1 {
                ans = max(ans, cache[i + 2][0] + prices[i])
            } else if choice == 0 {
                ans = max(ans, cache[i + 1][1] - prices[i])
            }
            
            cache[i][choice] = ans
        }
        
        i -= 1
    }

    return cache[0][0]
}

//print(maxProfit([1]))
//
//print(maxProfit([1,2,3,0,2]))
//
//print(maxProfit([1,2]))

