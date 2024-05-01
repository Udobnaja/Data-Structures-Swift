//
//  704. Binary Search.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 1.5.2024.
//

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] == target {
            return mid
        }
        
        if nums[mid] > target {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
   
    return -1
}

//print(search([-1,0,3,5,9,12], 9))
