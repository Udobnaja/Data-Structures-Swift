//
//  1338. Reduce Array Size to The Half.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 30.4.2024.
//

import Foundation

func minSetSize(_ arr: [Int]) -> Int {
    var s = arr.count / 2
    var dic = [Int: Int]()
    
    for item in arr {
        dic[item, default: 0] += 1
    }
    
    var c = 0
    var sorted = dic.values.sorted(by: >)
    for item in sorted {
        if s <= 0 {
            return c
        }
        
        s -= item
        c += 1
    }
    
    return c
}

//print(minSetSize([1,9]))
// [1000,1000,3,7]
// [9,77,63,22,92,9,14,54,8,38,18,19,38,68,58,19]

