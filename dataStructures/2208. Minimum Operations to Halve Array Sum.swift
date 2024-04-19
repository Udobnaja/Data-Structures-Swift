//
//  2208. Minimum Operations to Halve Array Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 08.04.2024.
//

import Foundation

func halveArray(_ nums: [Int]) -> Int {
    var count = 0
    let heap = MaxHeap<Double>()
    var initialSum: Double = 0

    for num in nums {
        let d = Double(num)
        heap.insert(d)
        initialSum += d
    }

    let half = initialSum / 2
    var newSum: Double = 0

    while half > newSum {
        guard let hp = heap.remove() else { break }
        let rm = hp / 2
        newSum += rm
        heap.insert(rm)
        count += 1
    }

    return count
}


//print(halveArray([3,8,20]))

