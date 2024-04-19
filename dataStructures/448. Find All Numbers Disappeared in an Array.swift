//
//  448. Find All Numbers Disappeared in an Array.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 03.04.2024.
//

import Foundation

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var i = 0
    var nums = nums
    while i < nums.count {
        let next_index = nums[i]
        if next_index == i + 1 {
            i += 1

            continue
        }

        let swap = nums[next_index - 1]
        nums[i] = swap
        nums[next_index - 1] = next_index

        if next_index == swap {
            i += 1
        }
    }

    var result = [Int]()

    for i in 0..<nums.count {
        if nums[i] != i + 1 {
            result.append(i + 1)
        }
    }

    return result
}

//print(findDisappearedNumbers([4,3,2,7,8,2,3,1]))



//print(findDisappearedNumbers([1, 4, 2, 5, 4]))

//func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//       var result = [Int]()
//   let s = Set(nums)
//
//   for i in 1...nums.count {
//       guard !s.contains(i) else { continue }
//
//       result.append(i)
//   }
//
//   return result
//   }

