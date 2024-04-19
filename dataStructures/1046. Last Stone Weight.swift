//
//  1046. Last Stone Weight.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 07.04.2024.
//

import Foundation

func lastStoneWeight(_ stones: [Int]) -> Int {
    guard stones.count > 1 else {
        return stones.count == 1 ? stones[0] : 0
    }
    let heap = MaxHeap<Int>()
    for stone in stones {
        heap.insert(stone)
    }

    while heap.count > 1 {
        let x = heap.remove()
        let y = heap.remove()

        guard let x, let y else { break }

        if x != y {
            heap.insert(abs(y - x))
        }
    }

    return heap.count == 1 ? heap.peek()! : 0
}

//print(lastStoneWeight([1]))

