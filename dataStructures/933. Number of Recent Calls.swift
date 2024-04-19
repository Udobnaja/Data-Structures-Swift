//
//  933. Number of Recent Calls.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 10.02.2024.
//

import Foundation

class RecentCounter {
    var q: [Int]
    var indx = 0

    init() {
        q = [Int]()
    }

    func ping(_ t: Int) -> Int {

        q.append(t)

        while q[indx] < t - 3000 {
            indx += 1
        }

        return q.count - indx
    }
//
//    var q: [Int]
//
//    init() {
//        q = [Int]()
//    }
//
//    func ping(_ t: Int) -> Int {
//
//        q.append(t)
//
//        while q.first != nil, q.first! < t - 3000 {
//            q.removeFirst()
//        }
//
//        return q.count
//    }
}
//let r = RecentCounter()
//
//let arr = [
//r.ping(1),
//r.ping(100),
//r.ping(3001),
//r.ping(3002)
//]
//
//sleep(5)
//
//print(arr)
