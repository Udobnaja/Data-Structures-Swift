//
//  1466. Reorder Routes to Make All Paths Lead to the City Zero.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 05.03.2024.
//

import Foundation

//func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
//    var result = 0
//    var works = [Int: [Int]]()
//    var cities = [Int: Int]()
//
//    for connection in connections {
//        works[connection[0], default: []].append(connection[1])
//    }
//
//    func check(_ key: Int) {
//        guard let towns = works[key] else { return }
//
//        for town  in towns {
//            guard cities[town] == nil, town != 0 else {
//                continue
//            }
//
//            result += 1
//            cities[town] = key
//            check(town)
//        }
//
//    }
//
//    while cities.count < connections.count {
//        for connection in connections {
//            if connection[0] == 0, cities[connection[1]] == nil {
//                result += 1
//                cities[connection[1]] = connection[0]
//                check(connection[1])
//            }
//
//            if connection[1] == 0, cities[connection[0]] == nil {
//                cities[connection[0]] = connection[1]
//                check(connection[0])
//            }
//
//            if cities[connection[1]] != nil, cities[connection[0]] == nil, connection[0] != 0 {
//                cities[connection[0]] = connection[1]
//                check(connection[0])
//            }
//        }
//    }
//
//    return result
//}

//func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
//    var result = 0
//    var cities = [Int: Int]()
//
//    var stack = [[Int]]()
//
//    func check(_ connection: [Int]) {
//        if cities[connection[1]] != nil, cities[connection[0]] == nil {
//            cities[connection[0]] = connection[1]
//            return
//        }
//
//        if cities[connection[0]] != nil, cities[connection[1]] == nil  {
//            result += 1
//            cities[connection[1]] = connection[0]
//            return
//        }
//
//        stack.append(connection)
//    }
//
//    for connection in connections {
//        if connection[0] == 0, cities[connection[1]] == nil {
//            cities[connection[1]] = connection[0]
//            result += 1
//            continue
//        }
//        if connection[1] == 0, cities[connection[0]] == nil {
//            cities[connection[0]] = 0
//            continue
//        }
//        check(connection)
//    }
//
//    while !stack.isEmpty {
//        check(stack.removeFirst())
//    }
//
//    return result
//}

func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    var graph = [Int: [Int]]()
    var seen: Set = [0]
    var initialConnections = Set<String>()

    for connection in connections {
        graph[connection[0], default: []].append(connection[1])
        graph[connection[1], default: []].append(connection[0])
        initialConnections.insert("\(connection[0])->\(connection[1])")
    }

    func dfs(_ town: Int) -> Int {
        guard let neighbours = graph[town] else { return 0 }
        var ans = 0
        for neighbour in neighbours {
            guard !seen.contains(neighbour) else { continue }

            if initialConnections.contains("\(town)->\(neighbour)") {
                ans += 1
            }
            seen.insert(neighbour)

            ans += dfs(neighbour)
        }

        return ans
    }

    return dfs(0)
}

//print(minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]))

