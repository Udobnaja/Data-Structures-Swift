//
//  542. 01 Matrix.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 16.03.2024.
//

import Foundation
func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    let rowLength = mat.count
    let colLength = mat[0].count
    var result = [[Int]](repeating: [Int](repeating: 0, count: colLength), count: rowLength)
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: colLength), count: rowLength)
    var q = [[Int]]()
    let directions = [(0, 1), (1, 0), (-1, 0), (0, -1)]

    func isValid(_ row: Int, _ col: Int) -> Bool {
        row >= 0 && row < rowLength && col >= 0 && col < colLength
    }

    for row in 0..<rowLength {
        for col in 0..<colLength {
            if mat[row][col] == 0 {
                q.append([row, col, 1])
                seen[row][col] = true
            }
        }
    }

    while !q.isEmpty {
        let cur = q.removeFirst()
        let row = cur[0]
        let col = cur[1]
        let steps = cur[2]

        for direction in directions {
            guard isValid(row + direction.0, col + direction.1), seen[row + direction.0][col + direction.1] == false else { continue }
            seen[row + direction.0][col + direction.1] = true
            q.append([row + direction.0, col + direction.1, steps + 1])
            result[row + direction.0][col + direction.1] = steps
        }
    }

    return result
}

//print(updateMatrix([[0,0,1,0,1,1,1,0,1,1],[1,1,1,1,0,1,1,1,1,1],[1,1,1,1,1,0,0,0,1,1],[1,0,1,0,1,1,1,0,1,1],[0,0,1,1,1,0,1,1,1,1],[1,0,1,1,1,1,1,1,1,1],[1,1,1,1,0,1,0,1,0,1],[0,1,0,0,0,1,0,0,1,1],[1,1,1,0,1,1,0,1,0,1],[1,0,1,1,1,0,1,1,1,0]]))
