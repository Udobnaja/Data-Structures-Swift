//
//  2368. Reachable Nodes With Restrictions.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.03.2024.
//

import Foundation

//func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
//    var seen = Set(restricted + [0])
//    var graph = [Int: [Int]]()
//    var num = 0
//
//    for edge in edges {
//        graph[edge[0], default: []].append(edge[1])
//        graph[edge[1], default: []].append(edge[0])
//    }
//
//    func dfs(_ node: Int) {
//        guard let connections = graph[node] else {
//            return
//        }
//
//        num += 1
//
//        for connection in connections {
//            guard !seen.contains(connection) else{ continue }
//            if restricted.contains(connection) {
//                continue
//            }
//            seen.insert(connection)
//            dfs(connection)
//        }
//    }
//
//    dfs(0)
//
//    return num
//}
//
//print(reachableNodes(7, [[0,1],[0,2],[0,5],[0,4],[3,2],[6,5]], [4,2,1]))


//func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
//    var seen = Set(restricted + [0])
//    var graph = [Int: [Int]]()
//    var num = 0
//
//    for edge in edges {
//        graph[edge[0], default: []].append(edge[1])
//        graph[edge[1], default: []].append(edge[0])
//    }
//
//    func dfs(_ node: Int) {
//        guard let connections = graph[node] else {
//            return
//        }
//
//        num += 1
//
//        for connection in connections {
//            guard !seen.contains(connection) else{ continue }
//            if restricted.contains(connection) {
//                continue
//            }
//            seen.insert(connection)
//            dfs(connection)
//        }
//    }
//
//    dfs(0)
//
//    return num
//}
//
//print(reachableNodes(7, [[0,1],[0,2],[0,5],[0,4],[3,2],[6,5]], [4,2,1]))
