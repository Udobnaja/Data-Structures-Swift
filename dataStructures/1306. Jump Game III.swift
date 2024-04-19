//
//  1306. Jump Game III.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 31.03.2024.
//

import Foundation

func canReach(_ arr: [Int], _ start: Int) -> Bool {
    var seen = Set<Int>()
    var q = [start]

    while !q.isEmpty {
        var nQ = [Int]()
        let qL = q.count

        for i in 0..<qL {
            let index = q[i]

            if arr[index] == 0 {
                return true
            }

            let next_inc = index + arr[index]
            if next_inc < arr.count && !seen.contains(next_inc) {
                seen.insert(next_inc)
                nQ.append(next_inc)
            }

            let next_dec = index - arr[index]
            if next_dec >= 0 && !seen.contains(next_dec) {
                seen.insert(next_dec)
                nQ.append(next_dec)
            }
        }

        q = nQ
    }

    return false
}

//print(canReach([3,0,2,1,2], 2))

