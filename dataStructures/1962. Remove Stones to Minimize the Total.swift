//
//  1962. Remove Stones to Minimize the Total.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.04.2024.
//

import Foundation


func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
    var k = k
    let h = MaxHeap<Double>()
    piles.forEach {
        h.insert(Double($0))
    }
    while k > 0 {
        guard let max = h.remove() else {
            break
        }

        let r = round(max / 2)

        h.insert(r)

        k -= 1
    }

    return Int(h.heap.reduce(0, +))
}

//print(minStoneSum([5,4,9], 2))
