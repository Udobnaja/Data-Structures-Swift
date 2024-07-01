//
//  216. Combination Sum III.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 1.7.2024.
//

import Foundation

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func b(_ arr: [Int], _ sum: Int = 0, _ start: Int = 1) {
        if arr.count == k && sum == n {
            result.append(arr)
            
            return
        }
        
        for i in start..<10 {
            let new_s = sum + i
            if new_s > n { break }
            b(arr + [i], new_s, i + 1)
        }
    }
    
    b([Int]())
    
    return result
}

//print(combinationSum3(9, 45))

