//
//  2294. Partition Array Such That Maximum Difference Is K.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 23.04.2024.
//

import Foundation

func partitionArray(_ nums: [Int], _ k: Int) -> Int {
    let nums = nums.sorted()
    var min = nums[0]
    var c = 1

    for num in nums {
        if num - min > k {
            c += 1
            min = num
        }
    }

    return c
}

//print(partitionArray([2,2,4,5], 0))
