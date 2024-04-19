//
//  05. Sort Array By Parity.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.03.2024.
//

import Foundation

func sortArrayByParity(_ nums: [Int]) -> [Int] {
    var l = 0
    var nums = nums
    var r = nums.count - 1

    while l < r {
        if nums[l] % 2 == 0 {
            l += 1
        } else if nums[r] % 2 != 0 {
            r -= 1
        } else {
            var temp = nums[l]

            nums[l] = nums[r]
            nums[r] = temp

            l += 1
            r -= 1
        }
    }

    return nums
}

//print(sortArrayByParity([3,1,2,4]))
