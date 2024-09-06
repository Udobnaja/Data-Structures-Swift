//
//  930. Binary Subarrays With Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 2.9.2024.
//

import Foundation

func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    var l = 0
    var cur = 0
    var ans = 0
    
    for r in 0..<nums.count {
        cur += nums[r]
        
        if cur < goal {
            continue
        }
        
        while cur > goal && l < r {
            cur -= nums[l]
            l += 1
        }
        
        if cur == goal {
            ans += 1
        }
      
        var tempL = l
        
        while tempL < r && cur - nums[tempL] == goal {
            ans += 1
            tempL += 1
        }
    }
    
    return ans
}

//print(numSubarraysWithSum([1,0,1,0,1], 2))
//print(numSubarraysWithSum([0,0,0,0,0], 0))
//
//print(numSubarraysWithSum([0,0,0,0,0,0,1,0,0,0], 0))
