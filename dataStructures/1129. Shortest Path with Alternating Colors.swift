//
//  1129. Shortest Path with Alternating Colors.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.03.2024.
//

import Foundation

func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
    var res = [Int]()

    let RED = 0
    let BLUE = 1

    var graph = [Int: [Int: [Int]]]()

    for edge in blueEdges {
        graph[BLUE, default: [:]][edge[0], default: []].append((edge[1]))
    }

    for edge in redEdges {
        graph[RED, default: [:]][edge[0], default: []].append((edge[1]))
    }

    var seen = [Int: [Int: Bool]]()
    var ans = [Int]()

    for i in 0..<n {
        seen[BLUE, default: [:]][i] = false
        seen[RED, default: [:]][i] = false
        ans.append(-1)
    }

    seen[RED]![0] = true
    seen[BLUE]![0] = true

    var q = [[0, RED], [0, BLUE]]
    var steps = 0
    while !q.isEmpty {
        let qL = q.count
        var newQ =  [[Int]]()
        for i in 0..<qL {
            let node = q[i]
            let val = node[0]
            let color = node[1]
            print("COLOR: ", color == RED ? "RED" : "BLUE", "VAL: ", val)
            ans[val] = ans[val] != -1 ? min(ans[val], steps) : steps

            guard let paths = graph[color]?[val] else { continue }

            print("есть ", color == RED ? "RED" : "BLUE", "со значением: ", val)

            for path in paths {
                let oposite = 1 - color
                guard !seen[oposite]![path]! else { continue }

                print("Ищем значение ", path, "с цветом: ", oposite == RED ? "RED" : "BLUE")

                seen[oposite]![path]! = true
                newQ.append([path, oposite])
            }
        }
        q = newQ
        steps += 1
    }

    return ans
}

//print(shortestAlternatingPaths(3, [[0,1]], [[2,1]]))

//n=7
//red: [[0,1],[0,2],[1,4],[1,2],[2,3]]
//blue: [[1,2],[2,5],[3,6]]
