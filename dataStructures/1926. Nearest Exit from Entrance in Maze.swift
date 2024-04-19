//
//  1926. Nearest Exit from Entrance in Maze.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 23.03.2024.
//

import Foundation

func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let rowCount = maze.count
       let colCount = maze[0].count
       let BLOCK: Character  = "+"

       func isValid(_ row: Int, _ col: Int) -> Bool {
           row >= 0 && row < rowCount && col >= 0 && col < colCount
       }

       func isExit(_ row: Int, _ col: Int) -> Bool {
           (row == 0 || row == rowCount - 1 || col == 0 || col == colCount - 1) && maze[row][col] != BLOCK
       }

       let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
       var seen = [[Bool]](repeating: [Bool](repeating: false, count: colCount), count: rowCount)


       seen[entrance[0]][entrance[1]] = true

       var q = [entrance]
       var steps = 0
       while !q.isEmpty {
           let curL = q.count
           var newQ = [[Int]]()

           for coords in q {
               let row = coords[0]
               let col = coords[1]
               if isExit(row, col) && [row, col] != entrance {
                   return steps
               }

               for direction in directions {
                   guard isValid(row + direction.0, col + direction.1), !seen[row + direction.0][col + direction.1], maze[row + direction.0][col + direction.1] != BLOCK else { continue }
                   seen[row + direction.0][col + direction.1] = true
                   newQ.append([row + direction.0, col + direction.1])
               }
           }

           q = newQ
           steps += 1
       }

       return -1
}

//print(nearestExit([["+","+","+"],[".",".","."],["+","+","+"]], [1,0]))

