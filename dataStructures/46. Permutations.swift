//
//  46. Permutations.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 14.5.2024.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var ans = [[Int]]()
    func backtrack(_ curr: inout [Int]) {
        guard curr.count != nums.count else {
            ans.append(curr)
            return
        }
        
        for num in nums {
            guard !curr.contains(num) else {
                continue
            }
            
            curr.append(num)
            backtrack(&curr)
            curr.removeLast()
        }
    }
    var ar = [Int]()
    backtrack(&ar)
    return ans
}

//permute([1,2,3])
