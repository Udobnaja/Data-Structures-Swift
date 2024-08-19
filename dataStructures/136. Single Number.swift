//
//  136. Single Number.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.8.2024.
//

import Foundation

// ---------------- //
//You must implement a solution with a linear runtime complexity and use only constant extra space.
// ---------------- //
func singleNumber(_ nums: [Int]) -> Int {
    var mask = 0
    for num in nums {
        mask ^= num
    }
    
    return mask
}
