//
//  1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.02.2024.
//

import Foundation

func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    var incr = [Int]()
    var decr = [Int]()
    var left = 0
    var answer = 0

    for right in 0..<nums.count {
        while !incr.isEmpty && incr[incr.count - 1] > nums[right] {
            incr.removeLast()
        }

        while !decr.isEmpty && decr[decr.count - 1] < nums[right]{
            decr.removeLast()
        }

        incr.append(nums[right])
        decr.append(nums[right])

        while decr[0] - incr[0] > limit {
            if nums[left] == decr[0] {
                decr.removeFirst()
            }

            if nums[left] == incr[0] {
                incr.removeFirst()
            }

            left += 1
        }

        answer = max(answer, right - left + 1)
    }

    return answer
}

//print(longestSubarray([8,2,4,7], 4))
