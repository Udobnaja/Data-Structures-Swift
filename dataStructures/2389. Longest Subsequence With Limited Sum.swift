//
//  2389. Longest Subsequence With Limited Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 5.5.2024.
//

import Foundation

func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
    var sorted = nums.sorted()
    for item in sorted.enumerated() {
        if item.0 == 0 {
            continue
        }
        
        sorted[item.0] = item.1 + sorted[item.0 - 1]
    }
    var result = [Int]()
    for query in queries {
        var l = 0
        var r = sorted.count - 1
        
        while l <= r {
            let mid = (l + r) / 2
            
            if sorted[mid] == query {
                r = mid
                break
            }
            
            if sorted[mid] > query {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        
        result.append(r + 1)
    }
    
    return result
}

//print(answerQueries([2,3,4,5], [1]))
