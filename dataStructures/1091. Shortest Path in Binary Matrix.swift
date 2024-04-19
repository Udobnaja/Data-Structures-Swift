//
//  1091. Shortest Path in Binary Matrix.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.03.2024.
//

import Foundation

//func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
//    let size = grid.count
//    guard grid[0][0] == 0 && grid[size - 1][size - 1] == 0 else {
//        return -1
//    }
//
//    if grid.count == 1 {
//        return 1
//    }
//
//    var stack = [(0, 0)]
//    var ans = 0
//    var seen = [Int: [Int: Bool]]()
//
//    while !stack.isEmpty {
//        var newStack = [(Int, Int)]()
//
//        ans += 1
//
//        print(stack)
//
//        for pair in stack {
////            guard seen[pair.0]?[pair.1] != true  else {
////                continue
////            }
//            //seen[pair.0, default: [Int: Bool]()][pair.1] = true
//            if pair.0 == size - 1 && pair.1 == size - 1 {
//                newStack = [(Int, Int)]()
//                break
//            }
//
//            guard grid[pair.0][pair.1] == 0 else {
//                continue
//            }
//
//            if pair.0 < size - 1 {
//                if pair.1 < size - 1, grid[pair.0 + 1][pair.1 + 1] == 0, seen[pair.0 + 1]?[pair.1 + 1] != true {
//                    seen[pair.0 + 1, default: [Int: Bool]()][pair.1 + 1] = true
//                    //if seen[pair.0 + 1]?[pair.1 + 1] != true {
//                        newStack.append((pair.0 + 1, pair.1 + 1))
//                    //}
//                }
//
//                if pair.1 > 0, grid[pair.0 + 1][pair.1 - 1] == 0, seen[pair.0 + 1]?[pair.1 - 1] != true {
//                    seen[pair.0 + 1, default: [Int: Bool]()][pair.1 - 1] = true
//                    newStack.append((pair.0 + 1, pair.1 - 1))
//                }
//
//                if grid[pair.0 + 1][pair.1] == 0, seen[pair.0 + 1]?[pair.1] != true {
//                    seen[pair.0 + 1, default: [Int: Bool]()][pair.1] = true
//                    newStack.append((pair.0 + 1, pair.1))
//                }
//                //if seen[pair.0 + 1]?[pair.1] != true {
//
//                //}
//            }
//
//            if pair.0 > 0 {
//                if pair.1 < size - 1, grid[pair.0 - 1][pair.1 + 1] == 0, seen[pair.0 - 1]?[pair.1 + 1] != true {
//                    seen[pair.0 - 1, default: [Int: Bool]()][pair.1 + 1] = true
//                    newStack.append((pair.0 - 1, pair.1 + 1))
//                }
//
//                if pair.1 > 0, grid[pair.0 - 1][pair.1 - 1] == 0, seen[pair.0 - 1]?[pair.1 - 1] != true {
//                    seen[pair.0 - 1, default: [Int: Bool]()][pair.1 - 1] = true
//                    newStack.append((pair.0 - 1, pair.1 - 1))
//                }
//
//                if grid[pair.0 - 1][pair.1] == 0, seen[pair.0 - 1]?[pair.1] != true {
//                    seen[pair.0 - 1, default: [Int: Bool]()][pair.1] = true
//                    newStack.append((pair.0 - 1, pair.1))
//                }
//            }
//
//
//
//            if pair.1 < size - 1, grid[pair.0][pair.1 + 1] == 0, seen[pair.0]?[pair.1 + 1] != true {
////                if seen[pair.0]?[pair.1 + 1] != true {
//                    seen[pair.0, default: [Int: Bool]()][pair.1 + 1] = true
//                    newStack.append((pair.0, pair.1 + 1))
////                }
//            }
//
//            if pair.1 > 0, grid[pair.0][pair.1 - 1] == 0, seen[pair.0]?[pair.1 - 1] != true {
////                if seen[pair.0]?[pair.1 + 1] != true {
//                seen[pair.0, default: [Int: Bool]()][pair.1 - 1] = true
//                    newStack.append((pair.0, pair.1 - 1))
////                }
//            }
//        }
//
//        stack = newStack
//    }
//
//    if seen[size - 1]?[size - 1] != true {
//        return -1
//    }
//
//    return ans
//}
//
//
//print(shortestPathBinaryMatrix([[0,1,0,0,0],[0,1,0,0,0],[0,0,0,0,1],[0,1,1,1,0],[0,1,0,0,0]]))

func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    let size = grid.count
    guard grid[0][0] == 0 && grid[size - 1][size - 1] == 0 else {
        return -1
    }
    let directions = [(0, 1), (1, 0), (1, 1), (-1, -1), (-1, 1), (1, -1), (0, -1), (-1, 0)]
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
    seen[0][0] = true

    var q = [[0, 0]]
    var level = 0

    func valid(_ row: Int, _ col: Int) -> Bool {
        row >= 0 && row < size && col >= 0 && col < size && grid[row][col] == 0
    }

    while !q.isEmpty {
        let curLength = q.count
        var nextQ = [[Int]]()
        level += 1

        for i in 0..<curLength {
            let row = q[i][0]
            let col = q[i][1]

            if row == size - 1 && col == size - 1 {
                return level
            }

            for (x, y) in directions {
                let nextRow = row + x
                let nextCol = col + y

                if (valid(nextRow, nextCol) && !seen[nextRow][nextCol]) {
                    seen[nextRow][nextCol] = true
                    nextQ.append([nextRow, nextCol])
                }
            }
        }

        q = nextQ
    }


    return -1
}

//print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]]))

