//
//  1512. Number of Good Pairs.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 18.8.2024.
//

import Foundation

func numIdenticalPairs(_ nums: [Int]) -> Int {
    var dic = [Int: Int]()
    var sum = 0
    for num in nums {
        dic[num, default: 0] += 1
        sum += dic[num]! - 1
    }
    
    return sum
}

//print(numIdenticalPairs([1,2,3]))
//print(numIdenticalPairs([1,2,3,1,1,3]))
//print(numIdenticalPairs([1,1,1,1]))
