//
//  209. Minimum Size Subarray Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.8.2024.
//

import Foundation

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var l = 0
    var sum = 0
    var res = Int.max
    
    for r in 0..<nums.count {
        sum += nums[r]

        while l <= r && sum >= target  {
            res = min(res, r - l + 1)
            sum -= nums[l]
            l += 1
        }
    }
    
    return res == Int.max ? 0 : res
}

//print(minSubArrayLen(7, [2,3,1,2,4,3]))

//print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
