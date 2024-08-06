//
//  64. Minimum Path Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 6.8.2024.
//

import Foundation


//func minPathSum(_ grid: [[Int]]) -> Int {
//    let row = grid.count
//    let col = grid[0].count
//    var cache = Array(repeating: Array(repeating: -1, count: col), count: row)
//    func dp(_ row: Int, _ col: Int) -> Int {
//        if row == 0 && col == 0 {
//            return grid[row][col]
//        }
//
//        if cache[row][col] != -1 {
//            return cache[row][col]
//        }
//
//
//        if row == 0 {
//            cache[row][col] = dp(row, col - 1) + grid[row][col]
//            return cache[row][col]
//        }
//
//        if col == 0 {
//            cache[row][col] = dp(row - 1, col) + grid[row][col]
//            return cache[row][col]
//        }
//
//        let rowPath = dp(row, col - 1) + grid[row][col]
//        let colPath = dp(row - 1, col) + grid[row][col]
//
//        cache[row][col] = min(rowPath, colPath)
//        return cache[row][col]
//    }
//
//    return dp(row - 1, col - 1)
//}

//func minPathSum(_ grid: [[Int]]) -> Int {
//    let row = grid.count
//    let col = grid[0].count
//    var cache = Array(repeating: Array(repeating: -1, count: col), count: row)
//    func dp(_ row: Int, _ col: Int) -> Int {
//        if row == 0 && col == 0 {
//            return grid[row][col]
//        }
//
//        if cache[row][col] != -1 {
//            return cache[row][col]
//        }
//
//        var ans = Int.max
//        if col > 0 {
//            ans = min(ans, dp(row, col - 1))
//        }
//
//        if row > 0 {
//            ans = min(ans, dp(row - 1, col))
//        }
//
//        cache[row][col] = ans + grid[row][col]
//        return cache[row][col]
//    }
//
//    return dp(row - 1, col - 1)
//}

//func minPathSum(_ grid: [[Int]]) -> Int {
//    let rowCount = grid.count
//    let colCount = grid[0].count
//    var mock = grid
//
//    for row in 0..<rowCount {
//        for col in 0..<colCount {
//            if row == 0 && col == 0 {
//                continue
//            }
//
//            var ans = Int.max
//
//            if col > 0 {
//                ans = min(ans, mock[row][col - 1])
//            }
//
//            if row > 0 {
//                ans = min(ans, mock[row - 1][col])
//            }
//
//            mock[row][col] = ans + mock[row][col]
//        }
//    }
//
//    return mock[rowCount - 1][colCount - 1]
//}

func minPathSum(_ grid: [[Int]]) -> Int {
    let rowCount = grid.count
    let colCount = grid[0].count
    var mock = grid[0]
    
    for row in 0..<rowCount {
        let rowMock = grid[row]
        for col in 0..<colCount {
            if row == 0 && col == 0 {
                continue
            }
            
            var ans = Int.max
            if col > 0 {
                ans = min(ans, mock[col - 1])
            }
    
            if row > 0 {
                ans = min(ans, mock[col])
            }
            
            mock[col] = ans + rowMock[col]
        }
    }

    return mock[colCount - 1]
}

//print(minPathSum([[1,2,3],[4,5,6]]))
