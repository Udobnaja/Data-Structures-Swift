//
//  63. Unique Paths II.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 6.8.2024.
//

import Foundation

//func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
//    let rowCount = obstacleGrid.count
//    let colCount = obstacleGrid[0].count
//    
//    var cache = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
//    
//    func dp(_ row: Int, _ col: Int) -> Int {
//        if row < 0 || col < 0 {
//            return 0
//        }
//        
//        if obstacleGrid[row][col] == 1 {
//            return 0
//        }
//        
//        if row == 0 && col == 0 {
//            return 1
//        }
//        
//        if cache[row][col] != -1 {
//            return cache[row][col]
//        }
//        
//        cache[row][col] = dp(row - 1, col) + dp(row, col - 1)
//        return cache[row][col]
//    }
//    
//    return dp(rowCount - 1, colCount - 1)
//}

// Somehow it's faster than the next one (memory too)
//func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
//    let rowCount = obstacleGrid.count
//    let colCount = obstacleGrid[0].count
//
//    var mock = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
//
//    for row in 0..<rowCount {
//        for col in 0..<colCount {
//            if obstacleGrid[row][col] == 1 {
//                continue
//            }
//
//            if row == 0 || col == 0 {
//                if row > 0 {
//                    mock[row][col] = mock[row - 1][col] == 1 ? 1 : 0
//                } else if col > 0 {
//                    mock[row][col] = mock[row][col - 1] == 1 ? 1 : 0
//                } else {
//                    mock[row][col] = 1
//                }
//
//            } else {
//                mock[row][col] = mock[row - 1][col] + mock[row][col - 1]
//            }
//        }
//    }
//
//    return mock[rowCount - 1][colCount - 1]
//}

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    guard obstacleGrid[0][0] == 0 else {
        return 0
    }
    
    let rowCount = obstacleGrid.count
    let colCount = obstacleGrid[0].count
    
    var mock = Array(repeating: 0, count: colCount)
    mock[0] = 1
    for row in 0..<rowCount {
        for col in 0..<colCount {
            if obstacleGrid[row][col] == 1 {
                mock[col] = 0
                continue
            }
            
            if row == 0 && col > 0 {
                mock[col] = mock[col - 1] == 1 ? 1 : 0
            } else if col == 0 {
                mock[col] = mock[col] == 1 ? 1 : 0
            } else {
                mock[col] = mock[col] + mock[col - 1]
            }
        }
    }
    
    return mock[colCount - 1]
}

//print(uniquePathsWithObstacles([[0,1],[0,0]]))
//
//print(uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))
//print(uniquePathsWithObstacles([[1,0]]))
//
//print(uniquePathsWithObstacles([[1],[0]]))
//print(uniquePathsWithObstacles([[0,0],[1,1],[0,0]])) //0
