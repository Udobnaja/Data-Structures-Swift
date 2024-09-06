//
//  461. Hamming Distance.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 26.8.2024.
//

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var ans = 0
    
    var x = x
    var y = y
    while x != y {
        if x & 1 != y & 1 {
            ans += 1
        }
        
        x >>= 1
        y >>= 1
    }
    
    return ans
}

//print(hammingDistance(1, 3))
