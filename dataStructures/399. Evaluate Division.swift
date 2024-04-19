//
//  399. Evaluate Division.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 29.03.2024.
//

import Foundation

func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    var graph = [String: [String: Double]]()
    var result = [Double]()

    for i in 0..<equations.count {
        let val = values[i]
        graph[equations[i][0], default: [String: Double]()][equations[i][1]] = val
        graph[equations[i][1], default: [String: Double]()][equations[i][0]] = 1 / val
    }

    func calc(_ x: String, _ y: String) -> Double {
        var seen: Set<String> = [x]
        var q = [(graph[x]!, 1.0)]

        while !q.isEmpty {
            var qL = q.count
            var nQ = [([String : Double], Double)]()

            for i in 0..<q.count {
                let node = q[i]
                for (key, value) in node.0 {
                    if key == y {
                        return value * node.1
                    }

                    guard !seen.contains(key), let val = graph[key] else { continue }
                    seen.insert(key)
                    nQ.append((val, value * node.1))
                }
            }
            q = nQ
        }

        return -1
    }

    for querie in queries {
        if let ans = graph[querie[0]]?[querie[1]]{
            result.append(ans)
        } else if graph[querie[0]] == nil || graph[querie[1]] == nil {
            result.append(-1)
        } else if querie[0] == querie[1] {
            result.append(1)
        } else {
            result.append(calc(querie[0], querie[1]))
        }
    }

    return result
}

//print(calcEquation([["x1","x2"],["x2","x3"],["x3","x4"],["x4","x5"]], [3.0,4.0,5.0,6.0], [["x1","x5"],["x5","x2"],["x2","x4"],["x2","x2"],["x2","x9"],["x9","x9"]]))

