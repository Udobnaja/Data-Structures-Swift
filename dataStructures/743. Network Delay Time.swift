//
//  743. Network Delay Time.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 28.8.2024.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
    struct Pair: Comparable {
        static func < (lhs: Pair, rhs: Pair) -> Bool {
            lhs.dist < rhs.dist
        }
        
        let dist: Int
        let node: Int
    }
        
    var graph = [Int: [(to: Int, weight: Int)]]()
    for time in times {
        let from = time[0] - 1
        let to = time[1] - 1
        let weight = time[2]
        graph[from, default: [(to: Int, weight: Int)]()].append((to, weight))
    }
    
    var distances = Array(repeating: Int.max, count: n)
    let heap = MaxHeap<Pair>()
    heap.insert(Pair(dist: 0, node: k - 1))
    distances[k - 1] = 0
    
    while !heap.isEmpty {
        let cur = heap.remove()!
        let curDist = cur.dist * -1
        let node = cur.node
        
        if curDist > distances[node] || graph[node] == nil {
           continue
        }
        
        for edge in graph[node]! {
            let nei = edge.to
            let weight = edge.weight
            let dist = curDist + weight
            
            if dist < distances[nei] {
                distances[nei] = dist
                heap.insert(Pair(dist: dist * -1, node: nei))
            }
        }
    }
    
    let ans = distances.max()!
    
    return ans == Int.max ? -1 : ans
}

//print(networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))
//print(networkDelayTime([[1,2,1]], 2, 1))
//print(networkDelayTime([[1,2,1]], 2, 2))
