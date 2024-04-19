//
//  547. Number of Provinces.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 03.03.2024.
//

import Foundation


func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var storage = [Set<Int>](repeating: Set<Int>(), count: isConnected.count)
    var seen = Set<Int>()
    var count = 0

    for row in 0..<isConnected.count {
        for col in 0..<isConnected.count {
            if isConnected[row][col] == 1 {
                storage[row].insert(col)
                storage[col].insert(row)
            }
        }
    }

    for i in 0..<isConnected.count {
        if !seen.contains(i) {
            count += 1
            seen.insert(i)
            dfs(i: i)
        }
    }

    func dfs(i: Int) {
        for connection in storage[i] {
            if !seen.contains(connection) {
                seen.insert(connection)
                dfs(i: connection)
            }
        }
    }

    return count
}

//print(findCircleNum([[1,1,0],[1,1,0],[0,0,1]]))
