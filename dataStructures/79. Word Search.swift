//
//  79. Word Search.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 25.5.2024.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard !word.isEmpty else {
        return false
    }
    var isExist = false
    let word = Array(word)
    
    let colC = board[0].count
    let rowC = board.count
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
       x >= 0 && x < rowC && y >= 0 && y < colC
    }
    
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0) ]
    
    func b(_ row: Int, _ col: Int, _ count: Int, _ seen: [[Bool]]) -> Bool{
        if count == word.count {
            return true
        }
        
        var seen = seen
        
        for direction in directions {
            let x = row + direction.0
            let y = col + direction.1
            if isValid(x, y) && !seen[x][y] {
                if word[count] == board[x][y] {
                    seen[x][y] = true
                    if (b(x, y, count + 1, seen)) {
                        return true
                    }
                    
                    seen[x][y] = false
                }
            }
        }
        
        return false
    }
    
    for row in 0..<rowC {
        for col in 0..<colC {
            if (board[row][col] == word[0]) {
                var seen = [[Bool]].init(repeating: [Bool].init(repeating: false, count: colC), count: rowC)
                
                seen[row][col] = true
                if b(row, col, 1, seen) {
                    return true
                }
            }
        }
    }
    
    return false
}

//print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))

