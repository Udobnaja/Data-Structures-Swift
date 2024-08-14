//
//  303. Range Sum Query - Immutable.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.8.2024.
//

import Foundation

class NumArray {
    private let nums: [Int]
    init(_ nums: [Int]) {
        var f = [nums[0]]
        for i in 1..<nums.count {
            f.append(nums[i] + f[i - 1])
        }
        self.nums = f
        
        print(f)
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        if left == 0 {
            return nums[right]
        } else {
            return nums[right] - nums[left - 1]
        }
    }
}


//let g = NumArray([-2,0,3,-5,2,-1])
/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
