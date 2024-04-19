//
//  841. Keys and Rooms.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 07.03.2024.
//

import Foundation

//func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
//    var graph = [Int: [Int]]()
//    var keys = Set(rooms[0])
//    var seen: Set = [0]
//
//    for i in 0..<rooms.count {
//        graph[i] = rooms[i]
//    }
//
//    func dfs(_ room: Int) {
//        guard let k = graph[room] else {
//            return
//        }
//
//        for key in k {
//            guard !seen.contains(key) else { continue }
//            seen.insert(key)
//            keys.insert(key)
//            dfs(key)
//        }
//    }
//
//    for i in 1..<rooms.count {
//        guard !seen.contains(i), keys.contains(i) else { continue }
//        seen.insert(i)
//        dfs(i)
//    }
//
//    return seen.count == rooms.count
//}

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var seen: Set = [0]

    func dfs(_ room: Int) {
        for key in rooms[room] {
            if !seen.contains(key) {
                seen.insert(key)
                dfs(key)
            }
        }
    }

    dfs(0)

    return seen.count == rooms.count
}

//print(canVisitAllRooms([[1,3],[3,0,1],[2],[0]]))
