//
//  1283. Find the Smallest Divisor Given a Threshold.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 9.5.2024.
//

import Foundation

func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
    var left = 0
    var right = nums.max()!
    
    func check(_ d: Int) -> Bool {
        var s = 0.0
        let tr = Double(threshold)
        
        for num in nums {
            s += ceil(Double(num) / Double(d))
            
            if s > tr {
                return false
            }
        }
        
        return s <= tr
    }
    
    while left <= right {
        let mid = (left + right) / 2
        
        if check(mid) {
            right = mid - 1
        } else {
            left = mid  + 1
        }
    }
    return left
}

//print(smallestDivisor([44,22,33,11,1], 5))
