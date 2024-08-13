//
//  1208. Get Equal Substrings Within Budget.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.8.2024.
//

import Foundation

func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
    let s = Array(s.utf8)
    let t = Array(t.utf8)
    var l = 0
    var res = 0
    var cost = 0
    
    for r in 0..<s.count {
        cost += abs(Int(s[r]) - Int(t[r]))
        
        while cost > maxCost {
            cost -= abs(Int(s[l]) - Int(t[l]))
            l += 1
        }
       
        res = max(res, r - l + 1)
    }
    
    return res
}

//print(equalSubstring("abcd", "cdef", 3))

//print(equalSubstring("abcd","bcdf", 3))

//print(equalSubstring("abcd", "acde", 0))
