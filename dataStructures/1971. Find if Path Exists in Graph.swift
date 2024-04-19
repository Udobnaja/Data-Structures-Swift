//
//  1971. Find if Path Exists in Graph.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 09.03.2024.
//

import Foundation

func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
    guard source != destination else { return true }
    var graph = [Int: Set<Int>]()

    for edge in edges {
        graph[edge[0], default: []].insert(edge[1])
        graph[edge[1], default: []].insert(edge[0])
    }

    var seen = Set<Int>()

    func dfs(_ from: Int, _ to: Int) -> Bool {
        guard let connectedNodes = graph[from] else { return false }

        seen.insert(from)

        if connectedNodes.contains(to) {
            return true
        }

        var isConnected = false

        for node in connectedNodes {
            guard !seen.contains(node) else { continue }
            if isConnected {
                break
            }
            isConnected = isConnected || dfs(node, to)
        }

        return isConnected
    }

    return dfs(source, destination)
}

//print(validPath(3,  [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5))

