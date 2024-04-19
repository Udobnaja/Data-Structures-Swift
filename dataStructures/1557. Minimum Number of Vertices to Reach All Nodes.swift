//
//  1557. Minimum Number of Vertices to Reach All Nodes.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 08.03.2024.
//

import Foundation

func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var allNodes = Set<Int>()
    var reachable = Set<Int>()

    for i in 0..<n {
        allNodes.insert(i)
    }

    for edge in edges {
        reachable.insert(edge[1])
    }

    return Array(allNodes.subtracting(reachable))
}

//print(findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]]))
