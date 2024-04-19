//
//  295. Find Median from Data Stream.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.04.2024.
//

import Foundation

class MedianFinder {
    private let max_h = MaxHeap<Int>()
    private let min_h = MaxHeap<Int>()
    init() {

    }

    func addNum(_ num: Int) {
        if max_h.isEmpty && min_h.isEmpty {
            max_h.insert(num)
        } else {
            if let max = max_h.peek(), num > max {
                min_h.insert(-num)
            } else {
                max_h.insert(num)
            }

            if max_h.count - min_h.count > 1 {
                min_h.insert(-max_h.remove()!)
            }

            if min_h.count - max_h.count >= 1 {
                max_h.insert(-min_h.remove()!)
            }
        }
    }

    func findMedian() -> Double {
        if max_h.count == min_h.count {
            return Double(max_h.peek()! - min_h.peek()!) / 2
        } else {
            return Double(max_h.peek() ?? 0)
        }
    }
}

//let m = MedianFinder()
//m.addNum(3)
//m.addNum(1)
//m.addNum(4)
//m.addNum(5)
//
//print(m.findMedian())
