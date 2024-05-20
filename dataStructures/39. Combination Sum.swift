//
//  39. Combination Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 20.5.2024.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var ans = [[Int]]()
    
    let count = candidates.count
    func backtrack(_ cur: [Int], _ sum: Int, _ start: Int) {
        if sum == target {
            ans.append(cur)
            return
        }
        
        var cur = cur
        for index in start..<count {
            let newSum = sum + candidates[index]
            guard newSum <= target else { continue }
            cur.append(candidates[index])
            backtrack(cur, newSum, index)
            cur.removeLast()
        }
    }
    
    backtrack([], 0, 0)
    
    return ans
}

//print(combinationSum([2], 1))

