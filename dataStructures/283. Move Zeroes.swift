//
//  283. Move Zeroes.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 26.03.2024.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var pointerZero = 0

    for i in 0..<nums.count {
        if nums[i] != 0 {
            var temp = nums[i]
            nums[i] = nums[pointerZero]
            nums[pointerZero] = temp
            pointerZero += 1
        }
    }
}

//var g = [1,0,1]
//moveZeroes(&g)
