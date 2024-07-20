//
//  322. Coin Change.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.7.2024.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount != 0 else {
        return 0
    }
    
    var dic = [Int: Int]()
    
    for coin in coins {
        dic[coin] = 1
    }
    
    func dp(_ am: Int) -> Int {
        if am == 0 {
            return 0
        }
        
        var count = Int.max
        
        for i in 0..<coins.count {
            let ostatok = am - coins[i] // key
            if ostatok < 0 { continue }
            
            let loop: Int
            if let cache = dic[ostatok] {
                loop = cache
            } else {
                loop = dp(ostatok)
            }
             
            if loop != Int.max{
                count = min(count, loop + 1)
            }
        }
        
        dic[am] = count
        
        return count
    }
    
    
    let loop = dp(amount)
    
    return loop == Int.max ? -1 : loop
}

//func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//    var dp = Array(repeating: Int.max, count: amount + 1)
//
//    dp[0] = 0
//
//    for coin in coins {
//        if coin < amount {
//            dp[coin] = 1
//        }
//    }
//
//    for i in 0...amount {
//        print("i: ", i)
//        for coin in coins {
//            if coin <= i, dp[i - coin] != Int.max {
//                dp[i] = min(dp[i], dp[i - coin] + 1)
//            }
//        }
//    }
//
//    return dp[amount] == Int.max ? -1 : dp[amount]
//}


//print("result: ", coinChange([2, 1, 5], 11))
//print("result: ", coinChange([186,419,83,408], 6249))
//print("result: ", coinChange([1,2, 3], 8))

//print("result: ", coinChange([2], 3))

// print("result: ", coinChange([130,129,400,289,230,135], 8270))

