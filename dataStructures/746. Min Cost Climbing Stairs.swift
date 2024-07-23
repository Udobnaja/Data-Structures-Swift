//
//  746. Min Cost Climbing Stairs.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 4.7.2024.
//

import Foundation

// DP

// top-down

//func minCostClimbingStairs(_ cost: [Int]) -> Int {
//    func dp(_ i: Int) -> Int {
//        guard i > 1 else { return 0 }
//        if let minCost = mapOfCost[i] {
//            return minCost
//        }
//        
//        mapOfCost[i] = min(dp(i - 1) + cost[i - 1], dp(i - 2) + cost[i - 2])
//        
//        return mapOfCost[i]!
//    }
//    
//    var mapOfCost = [Int: Int]()
//    
//    return dp(cost.count)
//}

// bottom-up
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    let n = cost.count
    
    var dpArr = Array(repeating: 0, count: n + 1)
    
    for i in 2...n {
        dpArr[i] = min(dpArr[i - 1] + cost[i - 1], dpArr[i - 2] + cost[i - 2])
    }
    
    return dpArr[n]
}

//print(minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))

//func minCostClimbingStairs(_ cost: [Int]) -> Int {
//    var cache = Array(repeating: -1, count: cost.count + 1)
//    func dp(_ i: Int) -> Int {
//        if i <= 1 {
//            return 0
//        }
//
//        if cache[i] == -1 {
//            cache[i] = min(dp(i - 1) + cost[i - 1], dp(i - 2) + cost[i - 2])
//        }
//
//        return cache[i]
//    }
//
//    return dp(cost.count)
//}

//func minCostClimbingStairs(_ cost: [Int]) -> Int {
//    let count = cost.count
//    
//    var cache = Array(repeating: 0, count: count)
//    
//    cache[0] = cost[0]
//    cache[1] = cost[1]
//    
//    for i in 2..<count {
//        cache[i] = min(cache[i - 1], cache[i - 2]) + cost[i]
//    }
//    
//    return min(cache[count - 1], cache[count - 2])
//}
//
//
//print(minCostClimbingStairs([10, 15, 20]))
