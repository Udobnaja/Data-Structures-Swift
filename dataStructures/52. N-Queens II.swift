//
//  52. N-Queens II.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 25.5.2024.
//

import Foundation

func totalNQueens(_ n: Int) -> Int {
    var res = 0
    
    func valid(_ row: Int, _ col: Int, _ matrix: [[Int]]) -> Bool {
        row >= 0 && row < n && col >= 0 && col < n
    }
    
    func backtrace(_ matrix: [[Int]], _ row: Int, _ cols: Set<Int>) {
        guard row < n else { return }
        var cols = cols
        var matrix = matrix
        for r in row..<n {
            if r - 1 >= 0, !matrix[r - 1].contains(1) {
                return
            }
            for col in 0..<n {
                guard !cols.contains(col) else { continue }
                var chanRow = r - 1
                var chanColL = col - 1
                var chanColR = col + 1
                var canRepeat = true
                while chanRow >= 0, canRepeat {
                    if valid(chanRow, chanColL, matrix) {
                        if matrix[chanRow][chanColL] == 1 {
                            canRepeat = false
                           break
                        }
                        
                    }
                    if valid(chanRow, chanColR, matrix) {
                        if matrix[chanRow][chanColR] == 1 {
                            canRepeat = false
                           break
                        }
                    }
                    chanRow -= 1
                    chanColL -= 1
                    chanColR += 1
                    
                }
                
                if !canRepeat {
                    continue
                }
                
                matrix[r][col] = 1
                cols.insert(col)
                if r == n - 1 {
                    res += 1
                    continue
                }
             
                backtrace(matrix, row + 1, cols)
                matrix[r][col] = 0
                cols.remove(col)
            }
        }
    }
    
    backtrace(
        [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: n),
        0,
        Set<Int>()
    )
    
    return res
}

//print(totalNQueens(5))
