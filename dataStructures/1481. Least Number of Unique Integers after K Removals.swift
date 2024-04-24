//
//  1481. Least Number of Unique Integers after K Removals.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 25.04.2024.
//

import Foundation

//func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
//    var dic = [Int: Int]()
//
//    for num in arr {
//        dic[num, default: 0] += 1
//    }
//
//    var heap = MaxHeap<Int>()
//
//    for el in dic {
//        heap.insert(-el.value)
//    }
//
//    var k = k
//
//    while k > 0 {
//        guard let n = heap.remove() else {
//            break
//        }
//
//        k -= 1
//
//        let diff = -n - 1
//        if diff > 0 {
//            heap.insert(-diff)
//        }
//    }
//
//    return heap.count
//}

func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
    var dic = [Int: Int]()

    for num in arr {
        dic[num, default: 0] += 1
    }

    var a = [Int]()
    for el in dic {
        a.append(el.value)
    }

    a.sort(by: >)

    var k = k

    while k > 0 {
        let val = a[a.count - 1]

        if val <= k {
            k -= val
            a.popLast()
        } else {
            break
        }
    }

    return a.count
}

//print(findLeastNumOfUniqueInts([5,5,4], 1))
