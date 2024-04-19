//
//  1051. Height Checker.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 29.03.2024.
//

import Foundation

//func heightChecker(_ heights: [Int]) -> Int {
//    var count = 0
//    let sorted = heights.sorted()
//
//    for i in 0..<sorted.count {
//        if sorted[i] != heights[i] {
//            count += 1
//        }
//    }
//
//    return count
//}

func heightChecker(_ heights: [Int]) -> Int { // bubble sort
    var hasSwaps = true
    var sorted = heights
    while hasSwaps {
        hasSwaps = false
        for i in 1..<sorted.count {
            if sorted[i - 1] > sorted[i] {
                hasSwaps = true
                sorted.swapAt(i - 1, i)
            }
        }
    }

    var count = 0
    for i in 0..<sorted.count {
        if sorted[i] != heights[i] {
            count += 1
        }
    }

    return count
}

//print(heightChecker([1,2,3,4,5]))
