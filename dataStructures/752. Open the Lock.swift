//
//  752. Open the Lock.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 25.03.2024.
//

import Foundation

func openLock(_ deadends: [String], _ target: String) -> Int {
    var deadends = Set(deadends.map { $0.map { Int(String($0)) ?? 0 } })
    let start = [0, 0, 0, 0]
    if deadends.contains(start) {
        return -1
    }
    var q = [start]
    var seen: Set<[Int]> = [start]
    var target = target.map { Int(String($0)) ?? 0 }

    func increment(_ arr: [Int], _ position: Int) -> [Int] {
        var arr = arr
        arr[position] = arr[position] == 9 ? 0 : arr[position] + 1
        return arr
    }

    func decrement(_ arr: [Int], _ position: Int) -> [Int] {
        var arr = arr
        arr[position] = arr[position] == 0 ? 9 : arr[position] - 1
        return arr
    }

    var steps = 0

    while !q.isEmpty {
        var qL = q.count
        var nQ = [[Int]] ()

        for i in 0..<qL {
            let node = q[i]

            if node == target {
                return steps
            }

            for position in 0..<4 {
                let incNext = increment(node, position)
                if !seen.contains(incNext), !deadends.contains(incNext) {
                    seen.insert(incNext)
                    nQ.append(incNext)
                }

                let decNext = decrement(node, position)
                if !seen.contains(decNext), !deadends.contains(decNext) {
                    seen.insert(decNext)
                    nQ.append(decNext)
                }
            }
        }

        q = nQ
        steps += 1
    }

    return -1
}

//print(openLock(["0201","0101","0102","1212","2002"], "0202"))
