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

