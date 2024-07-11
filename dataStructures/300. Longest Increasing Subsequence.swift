//
//  300. Longest Increasing Subsequence.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 11.7.2024.
//

import Foundation

// bt
func lengthOfLIS(_ nums: [Int]) -> Int {
    var results = Array(repeating: 1, count: nums.count)
    
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[j] < nums[i] {
                results[i] = max(results[i], results[j] + 1)
            }
        }
    }
    
    return results.max()!
}

// tb
//func lengthOfLIS(_ nums: [Int]) -> Int {
//    func dp(_ i: Int) -> Int {
//        guard memo[i] == -1 else {
//            return memo[i]
//        }
//
//        var ans = 1
//        for j in 0..<i {
//            if nums[j] < nums[i] {
//                ans = max(ans, dp(j) + 1)
//            }
//        }
//
//        memo[i] = ans
//        return memo[i]
//    }
//
//    var memo = Array(repeating: -1, count: nums.count)
//
//    var ans = 0
//
//    for i in 0..<nums.count {
//        ans = max(ans, dp(i))
//    }
//
//    return ans
//}

//print(lengthOfLIS([10,9,2,5,3,7,101,18]))
//print(lengthOfLIS([7, 7]))

