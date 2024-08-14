//
//  724. Find Pivot Index.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.8.2024.
//

import Foundation

//func pivotIndex(_ nums: [Int]) -> Int {
//    var sum = [nums[0]]
//    let count = nums.count
//
//    for i in 1..<count {
//        sum.append(sum[i - 1] + nums[i])
//    }
//
//    for l in 0..<count {
//        if sum[l] - nums[l] == sum[count - 1] - sum[l] {
//            return l
//        }
//    }
//
//    return -1
//}

//func pivotIndex(_ nums: [Int]) -> Int {
//    let sum = nums.reduce(0, +)
//    let count = nums.count
//    var cur = 0
//
//    for l in 0..<count {
//        cur += nums[l]
//        if cur * 2 == sum + nums[l] {
//            return l
//        }
//    }
//
//    return -1
//}

func pivotIndex(_ nums: [Int]) -> Int {
    let sum = nums.reduce(0, +)
    let count = nums.count
    var cur = nums[0]
    // This condition makes it faster
    if sum - nums[0] == 0 {
        return 0
    }

    for l in 1..<count {
        cur += nums[l]
        if cur == sum - cur + nums[l] {
            return l
        }
    }

    return -1
}


//print(pivotIndex([1,7,3,6,5,6]))
//print(pivotIndex([1,2,3]))
//print(pivotIndex([2,1,-1]))
//
//print(pivotIndex([-1,-1,-1,-1,0,1])) // 1
//print(pivotIndex([-1,-1,0,1,1,0])) // 5

