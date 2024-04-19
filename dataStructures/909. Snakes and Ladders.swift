//
//  909. Snakes and Ladders.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 24.03.2024.
//

import Foundation

func snakesAndLadders(_ board: [[Int]]) -> Int {
    let n = board.count
    var g = [Int: [Int]]()
    var boardSQ = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var counter = 1

    for i in stride(from: n-1, through: 0, by: -1) {
        if (n-1-i) % 2 == 0 {
            for j in 0..<n {
                g[counter] = [i, j]
                boardSQ[i][j] = counter
                counter += 1
            }
        } else {
            for j in stride(from: n-1, through: 0, by: -1) {
                g[counter] = [i, j]
                boardSQ[i][j] = counter
                counter += 1
            }
        }
    }

    func next(_ curr: Int) -> [Int] {
        [curr + 1, min(curr + 6, n * n)]
    }

    var q = [[n - 1, 0]]
    var steps = 0

    while !q.isEmpty {
        let qL = q.count
        var newQ = [[Int]]()

        for i in 0..<qL {
            let node = q[i]
            let row = node[0]
            let col = node[1]

            if boardSQ[row][col] == n * n {
                return steps
            }

            let nextRange = next(boardSQ[row][col])
            for pointer in nextRange[0]...nextRange[1] {
                if let nextNode = g[pointer] {
                    let nextRow = nextNode[0]
                    let nextCol = nextNode[1]
                    guard !seen[nextRow][nextCol] else { continue }
                    seen[nextRow][nextCol] = true

                    if board[nextRow][nextCol] == -1 {
                        newQ.append([nextRow, nextCol])
                    } else if let ladder = g[board[nextRow][nextCol]] {
                        newQ.append([ladder[0], ladder[1]])
                    }
                }
            }
        }

        q = newQ
        steps += 1
    }

    return -1
}

//print(snakesAndLadders([[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]))
