//
//  323. Number of Connected Components in an Undirected Graph.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 10.03.2024.
//

import Foundation

func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var graph = [Int: [Int]]()
        var connected = 0
        var seen = Set<Int>()
        var uniq = Set<Int>()

        for edge in edges {
            uniq.insert(edge[0])
            uniq.insert(edge[1])
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }

        func dfs(_ node: Int) {
            guard let pair = graph[node] else { return }

            for item in pair {
                guard !seen.contains(item) else { continue }
                seen.insert(item)
                dfs(item)
            }
        }

        for edge in uniq {
            guard !seen.contains(edge) else { continue }

            connected += 1
            seen.insert(edge)
            dfs(edge)
        }

        if seen.count < n {
            connected += n - seen.count
        }

        return connected
}

//print(countComponents(4,  [[2,3],[1,2],[1,3]]))

