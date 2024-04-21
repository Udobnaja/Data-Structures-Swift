//
//  703. Kth Largest Element in a Stream.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 21.04.2024.
//

import Foundation

class KthLargest {
    private let h = MaxHeap<Int>()
    private let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            h.insert(-num)
        }

        while h.count > k {
            h.remove()
        }
    }

    func add(_ val: Int) -> Int {
        h.insert(-val)

        if h.count > k {
            h.remove()
        }
        return -(h.peek() ?? 0)
    }
}

//let l = KthLargest(3, [4, 5, 8, 2])
//
//print(l.add(3))
//print(l.add(5))
//print(l.add(10))
//print(l.add(9))
//print(l.add(4))
