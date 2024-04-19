//
//  1167. Minimum Cost to Connect Sticks.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.04.2024.
//

import Foundation

func connectSticks(_ sticks: [Int]) -> Int {
    var h = MaxHeap<Int>()

    for stick in sticks {
        h.insert(-stick)
    }

    var cost = 0

    while h.count > 1 {
        guard let l = h.remove(), let r = h.remove() else { break }

        let sum = l + r
        cost += -sum

        h.insert(sum)
    }

    return cost
}

//print(connectSticks([2,4,3]))

