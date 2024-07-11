//
//  198. House Robber.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 8.7.2024.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    let n = nums.count
    if n == 1 {
        return nums[0]
    }

    var twoStep = nums[0]
    var oneStep = max(nums[0], nums[1])
    
    var i = 2
    
    while i < n {
        let temp = oneStep
        oneStep = max(oneStep, twoStep + nums[i])
        twoStep = temp
        
        i += 1
    }
    
    return oneStep
}

//func rob(_ nums: [Int]) -> Int {
//    let n = nums.count
//    if n == 1 {
//        return nums[0]
//    }
//
//    var dp = Array(repeating: 0, count: n)
//
//    dp[0] = nums[0]
//    dp[1] = max(nums[0], nums[1])
//
//    var i = 2
//
//    while i < n {
//        dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
//
//        i += 1
//    }
//
//    return dp[n - 1]
//}

//func rob(_ nums: [Int]) -> Int {
//    var houses = [Int: Int]()
//    func dp(_ i: Int) -> Int {
//        if i == 0 {
//            return nums[i]
//        }
//
//        if i == 1 {
//            return max(nums[0], nums[1])
//        }
//
//        if let amount = houses[i] {
//            return amount
//        } else {
//            houses[i] = max(dp(i - 1), dp(i - 2) + nums[i])
//        }
//
//        return houses[i]!
//    }
//
//    return dp(nums.count - 1)
//}

//print(rob([2,1,1,2]))
