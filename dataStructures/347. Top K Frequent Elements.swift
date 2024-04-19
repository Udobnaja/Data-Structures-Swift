//
//  347. Top K Frequent Elements.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 16.04.2024.
//

import Foundation

struct Comp: Comparable {
    static func < (lhs: Comp, rhs: Comp) -> Bool {
        lhs.f < rhs.f
    }

    let f: Int
    let v: Int
}

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var f = [Int: Int]()

    for num in nums {
        f[num, default: 0] += 1
    }

    let m_h = MaxHeap<Comp>()

    for d in f {
        m_h.insert(Comp(f: -d.value, v: d.key))

        if m_h.count > k {
            m_h.remove()
        }
    }

    return m_h.heap.map { $0.v }
}

//print(topKFrequent([1], 1))

