//
//  78. Subsets.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.5.2024.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    let count = nums.count
    var ans = [[Int]]()
    
    func backtrack(_ cur: [Int], _ index: Int) {
        var cur = cur
        
        ans.append(cur)
        guard cur.count != count else {
            return
        }
        
        for i in 0..<count {
            if index > i { continue }
            cur.append(nums[i])
            backtrack(cur, i + 1)
            cur.removeLast()
        }
    }
    
    backtrack([], 0)
    
    return ans
}

//print(subsets([1,2,3]))
