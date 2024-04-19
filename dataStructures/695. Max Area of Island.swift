//
//  695. Max Area of Island.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 11.03.2024.
//

import Foundation

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var maximum = 0
    let rawCount = grid.count
    let calCount = grid[0].count
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: calCount), count: rawCount)

    func dfs(_ col: Int, _ island: Int) -> Int {
        guard col>=0, island>=0, col < rawCount, island < calCount, grid[col][island] == 1 else { return 0 }

        guard !seen[col][island] else { return 0 }
        seen[col][island] = true

        return dfs(col + 1, island) + dfs(col, island + 1) + dfs(col - 1, island) + dfs(col, island - 1) + 1
    }

    for col in 0..<rawCount {
        for island in 0..<calCount {
            if grid[col][island] == 1 {
                maximum = max(maximum, dfs(col, island))
            }
        }
    }

    return maximum
}

//print(maxAreaOfIsland(
//    [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
//)
//)

