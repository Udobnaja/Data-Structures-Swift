//
//  1231. Divide Chocolate.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 10.5.2024.
//

import Foundation

func maximizeSweetness(_ sweetness: [Int], _ k: Int) -> Int {
    if sweetness.count == k + 1 {
        return sweetness.min()!
    }
    
    var left = sweetness.min()!
    var right = sweetness.reduce(0, +) / (k + 1)
    
    func check(_ sweet: Int) -> Bool {
        var count = k + 1, sum = 0
          for piece in sweetness {
            guard count > 0 else { break }
            sum += piece
            if sum >= sweet {
              sum = 0
              count -= 1
            }
          }
          return count == 0
    }
    
    while left <= right {
        let mid = (left + right) / 2
        
        if check(mid) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return right
}

//print(maximizeSweetness([1,2,2,1,2,2,1,2,2], 2))
