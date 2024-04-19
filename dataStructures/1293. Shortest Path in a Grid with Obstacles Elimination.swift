//
//  1293. Shortest Path in a Grid with Obstacles Elimination.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 18.03.2024.
//

import Foundation


func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
    let rowLength = grid.count
    let colLength = grid[0].count
    var seen = [[Int]](repeating: [Int](repeating: -1, count: colLength), count: rowLength)
    var q = [[0, 0, k, 0]]

    let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]

    func isValid(_ row: Int, _ col: Int) -> Bool {
        row >= 0 && row < rowLength && col >= 0 && col < colLength
    }

    while !q.isEmpty {
        let node = q.removeFirst()
        let row = node[0]
        let col = node[1]
        let steps = node[3]
        var remain = node[2]
        if row == rowLength - 1 && col == colLength - 1 {
            return steps
        }

        if grid[row][col] == 1 {
            if remain == 0 {
                continue
            } else {
                remain -= 1
            }
        }

        if seen[row][col] >= remain {
           continue
       }

       seen[row][col] = remain

        for direction in directions {
            let row = node[0] + direction.0
            let col = node[1] + direction.1


            guard isValid(row, col) else {
                continue
            }

            q.append([row, col, remain, steps + 1])
        }
    }

    return -1
}


//print(shortestPath([[0,0],[1,0],[1,0],[1,0],[1,0],[1,0],[0,0],[0,1],[0,1],[0,1],[0,0],[1,0],[1,0],[0,0]], 4))
