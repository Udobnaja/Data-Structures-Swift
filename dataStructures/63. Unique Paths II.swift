//
//  63. Unique Paths II.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 6.8.2024.
//

import Foundation

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let rowCount = obstacleGrid.count
    let colCount = obstacleGrid[0].count
    
    var cache = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
    
    func dp(_ row: Int, _ col: Int) -> Int {
        if row < 0 || col < 0 {
            return 0
        }
        
        if obstacleGrid[row][col] == 1 {
            return 0
        }
        
        if row == 0 && col == 0 {
            return 1
        }
        
        if cache[row][col] != -1 {
            return cache[row][col]
        }
        
        cache[row][col] = dp(row - 1, col) + dp(row, col - 1)
        return cache[row][col]
    }
    
    return dp(rowCount - 1, colCount - 1)
}

//print(uniquePathsWithObstacles([[0,1],[0,0]]))
