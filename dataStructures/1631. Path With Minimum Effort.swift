//
//  1631. Path With Minimum Effort.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 7.5.2024.
//

import Foundation

func minimumEffortPath(_ heights: [[Int]]) -> Int {
    var left = 0
    var right = heights.reduce(0, {
        max($0, $1.reduce(
            0, { max($0, $1)}
        ))
    })
    
    let directions = [(1, 0), (0, 1), (0, -1), (-1, 0)]
    let rowCount = heights.count
    let colCount = heights[0].count
    
    func valid(_ row: Int, _ col: Int) -> Bool {
        row >= 0 && col >= 0 && row < rowCount && col < colCount
    }
    
    func check(_ effort: Int) -> Bool {
        var seen = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        seen[0][0] = true
        var stack = [[0, 0]]
        
        while !stack.isEmpty {
            let el = stack.popLast()!
            let row = el[0]
            let col = el[1]
            
            if row == rowCount - 1 && col == colCount - 1 {
                return true
            }
            
            for direction in directions {
                let newRow = row + direction.0
                let newCol = col + direction.1
                
                if valid(newRow, newCol) && !seen[newRow][newCol] {
                    if abs(heights[newRow][newCol] - heights[row][col]) <= effort {
                        seen[newRow][newCol] = true
                        stack.append([newRow, newCol]);
                    }
                    
                }
            }
        }
        return false
    }
    
    while left <= right {
        let mid = (left + right) / 2
        
        if (check(mid)) {
           right = mid - 1;
        } else {
           left = mid + 1;
        }
    }
       
    return left
}

//print(minimumEffortPath([[1,2,2],[3,8,2],[5,3,5]]))

