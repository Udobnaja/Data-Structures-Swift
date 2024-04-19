//
//  973. K Closest Points to Origin.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.04.2024.
//

import Foundation

struct Comp_2: Comparable {
    static func < (lhs: Comp_2, rhs: Comp_2) -> Bool {
        return lhs.v < rhs.v
    }

    let f: [Int]
    let v: Double
}

func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    let h = MaxHeap<Comp_2>()

    for point in points {
        let x = point[0]
        let y = point[1]

        let v = sqrt(pow(Double(x),2) + pow(Double(y),2))
        h.insert(Comp_2(f: point, v: v))

        if h.count > k {
            h.remove()
        }
    }

    return h.heap.map { $0.f }
}

//print(kClosest([[3,3],[5,-1],[-2,4]], 2))
