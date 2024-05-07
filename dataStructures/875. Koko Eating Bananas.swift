//
//  875. Koko Eating Bananas.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 6.5.2024.
//

import Foundation

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    func check(_ k: Int) -> Bool {
        var h_c = 0
        for b in piles {
            h_c += Int(ceil(Double(b) / Double(k)))
        }
        
        return h_c <= h
    }
    
    var l = 1
    var r = piles.reduce(0, { max($0, $1) })
    
    while l <= r {
        let mid = (l + r) / 2
        
        if check(mid) {
            r = mid - 1
        } else {
            l = mid + 1
        }
    }
    
    return l
}

//print(minEatingSpeed([30,11,23,4,20], 5))

