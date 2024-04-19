//
//  2101. Detonate the Maximum Bombs.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 05.04.2024.
//

import Foundation

func maximumDetonation(_ bombs: [[Int]]) -> Int {
    guard !bombs.isEmpty else { return -1 }

    var graph = [Int: [Int]]()

    for i in 0..<bombs.count {
        let bomb = bombs[i]

        let x = bomb[0]; let y = bomb[1]; let r = bomb[2]

        for j in 0..<bombs.count {
            guard j != i else { continue }
            let next_bomb = bombs[j]
            let x_1 = next_bomb[0]; let y_1 = next_bomb[1]; let r_1 = next_bomb[2]

            let x_d = abs(x_1 - x)
            let y_d = abs(y_1 - y)

            if x_d * x_d + y_d * y_d <= r * r {
                graph[i, default: [Int]()].append(j)
            }
        }
    }

    var seen = Set<Int>()
    var m = 1

    func dfs(_ nodes: [Int]?) {
        guard let nodes else { return }
        for node in nodes {
            guard !seen.contains(node) else { continue }
            seen.insert(node)
            dfs(graph[node])
        }
    }

    for node in graph {
        seen = Set<Int>()
        seen.insert(node.key)
        dfs(node.value)

        m = max(m, seen.count)
    }

    return m
}

//print(maximumDetonation([[4,4,3],[4,4,3]]))
