//
//  215. Kth Largest Element in an Array.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 18.04.2024.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let h = MaxHeap<Int>()

    nums.forEach {
        h.insert($0)
    }

    var k = k
    while k > 1 {
        h.remove()
        k -= 1
    }

    return h.remove() ?? 0
}

//print(findKthLargest(  [3,2,3,1,2,4,5,5,6], 4))
