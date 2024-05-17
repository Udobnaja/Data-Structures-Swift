//
//  797. All Paths From Source to Target.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 17.5.2024.
//

import Foundation

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var ans = [[Int]]()
    let count = graph.count - 1
    
    func backtrace(_ node: Int, _ cur: [Int]) {
        var cur = cur
        
        cur.append(node)
        
        guard node < count else {
            ans.append(cur)
            return
        }
        
        for next in graph[node] {
            backtrace(next, cur)
        }
    }
    
    backtrace(0, [])
    
    return ans
}

//allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])
