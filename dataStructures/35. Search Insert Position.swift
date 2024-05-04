//
//  35. Search Insert Position.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 4.5.2024.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var (l, r) = (0, nums.count - 1)
    
    while l <= r {
        let mid = (l + r) / 2
        let num = nums[mid]
        
        if num == target {
            return mid
        }
        
        if num < target {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }
    
    return l
}

//print(searchInsert([1,3,5,6], 7))
