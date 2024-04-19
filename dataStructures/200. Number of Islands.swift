//
//  200. Number of Islands.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 04.03.2024.
//

import Foundation

//func numIslands(_ grid: [[Character]]) -> Int {
//    let colLength = grid.count
//    let rowLength = grid[0].count
//    var seen = [[Bool]](repeating: [Bool](repeating: false, count: rowLength), count: colLength)
//    var count = 0
//    func dfs(_ col: Int, _ row: Int) {
//        guard col < colLength, row < rowLength, seen[col][row] == false else {
//            return
//        }
//
//        seen[col][row] = true
//
//        if grid[col][row] == "1" {
//            let top =  col > 0 ?  grid[col - 1][row] : "0"
//            let bottom = col + 1 < colLength ? grid[col + 1][row] : "0"
//            let left = row > 0  ? grid[col][row - 1] : "0"
//            let right = row + 1 < rowLength ? grid[col][row + 1] : "0"
//            if top != "0" {
//                dfs(col - 1, row)
//            }
//
//            if bottom != "0" {
//                dfs(col + 1, row)
//            }
//
//            if left != "0" {
//                dfs(col, row - 1)
//            }
//
//            if right != "0" {
//                dfs(col, row + 1)
//            }
//        }
//    }
//
//    for col in 0..<colLength {
//        for row in 0..<rowLength {
//            guard seen[col][row] == false else {
//                continue
//            }
//
//            seen[col][row] = true
//            if grid[col][row] == "1" {
//                count += 1
//                dfs(col + 1, row)
//                dfs(col, row + 1)
//            }
//        }
//    }
//    return count
//}

func numIslands(_ grid: [[Character]]) -> Int {
    let colLength = grid.count
    let rowLength = grid[0].count
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: rowLength), count: colLength)
    var count = 0
    func dfs(_ col: Int, _ row: Int) {
        guard col >= 0, row >= 0, col < colLength, row < rowLength, seen[col][row] == false, grid[col][row] == "1" else {
            return
        }

        seen[col][row] = true
        dfs(col - 1, row)
        dfs(col + 1, row)
        dfs(col, row - 1)
        dfs(col, row + 1)
    }

    for col in 0..<colLength {
        for row in 0..<rowLength {
            guard seen[col][row] == false else {
                continue
            }
            if grid[col][row] == "1" {
                count += 1
                dfs(col, row)
            }
        }
    }
    return count
}

// print(numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]))

