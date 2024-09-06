//
//  2233. Maximum Product After K Increments.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.8.2024.
//

import Foundation

// this program technically gives a correct answer, but it will run into Time Limit Exceeded
//func maximumProduct(_ nums: [Int], _ k: Int) -> Int {
//    var heap = MaxHeap<Int>()
//    for num in nums {
//        heap.insert(num * -1)
//    }
//
//    for count in 0..<k {
//        let num = heap.remove()!
//        heap.insert(num - 1)
//    }
//
//    let mult = heap.count % 2 == 0 ? 1 : -1
//    return heap.heap.reduce(mult, *) % 1_000_000_007
//}

func maximumProduct(_ nums: [Int], _ k: Int) -> Int {
    let heap = MaxHeap<Int>()
    for num in nums {
        heap.insert(num * -1)
    }
    
    for _ in 0..<k {
        let num = heap.remove()!
        heap.insert(num - 1)
    }
    
    let mult = heap.count % 2 == 0 ? 1 : -1
    return heap.heap.reduce(mult, { $0 * $1 % 1_000_000_007 })
}

//print(maximumProduct([0,4], 5))
//print(maximumProduct([6,3,3,2], 2))
//print(maximumProduct([9,7,8], 9))

//print(maximumProduct([24,5,64,53,26,38], 54))
