//
//  1695. Maximum Erasure Value.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 2.9.2024.
//

import Foundation

func maximumUniqueSubarray(_ nums: [Int]) -> Int {
    var l = 0
    
    var ans = nums[0]
    var prefSum = [ans]
    var set: Set<Int> = [ans]
    
    for r in 1..<nums.count {
        prefSum.append(prefSum[r - 1] + nums[r])
        while set.contains(nums[r]) {
            set.remove(nums[l])
            l += 1
        }
        
        set.insert(nums[r])
        ans = max(ans, l == 0 ? prefSum[r] : prefSum[r] - prefSum[l - 1])
    }
    
    return ans
}

//print(maximumUniqueSubarray([4,2,4,5,6]))
//print(maximumUniqueSubarray([5,2,1,2,5,2,1,2,5]))
