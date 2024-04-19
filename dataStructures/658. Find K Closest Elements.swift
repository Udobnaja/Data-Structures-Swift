//
//  658. Find K Closest Elements.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 17.04.2024.
//

import Foundation


struct Comp_1: Comparable {
    static func < (lhs: Comp_1, rhs: Comp_1) -> Bool {
        if lhs.f == rhs.f {
            return lhs.v <= rhs.v
        }

        return lhs.f < rhs.f
    }

    let f: Int
    let v: Int
}

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    let m_x = MaxHeap<Comp_1>()

    for el in arr {
        let diff = abs(x - el)

        m_x.insert(Comp_1(f: diff, v: el))

        if m_x.count > k {
            m_x.remove()
        }
    }

    return m_x.heap.map { $0.v }.sorted()
}

//print(findClosestElements([0,0,1,2,3,3,4,7,7,8], 3, 5))
