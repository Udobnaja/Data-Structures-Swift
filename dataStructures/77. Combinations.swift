//
//  77. Combinations.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 16.5.2024.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var ans = [[Int]]()
    
    func backtrack(_ cur: [Int], _ i: Int) {
        if cur.count == k {
            ans.append(cur)
            return
        }
        
        guard i <= n else { return }
        
        var cur = cur
        
        for num in i...n {
            cur.append(num)
            backtrack(cur, num + 1)
            cur.removeLast()
        }
        
    }
    
    backtrack([], 1)
    
    return ans
}

//func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        var ans = [[Int]]()
//
//    func backtrack(_ cur: [Int], _ i: Int) {
//        if cur.count == k {
//            ans.append(cur)
//            return
//        }
//
//        var cur = cur
//
//        for num in 1...n {
//            guard num > i else { continue }
//            cur.append(num)
//            backtrack(cur, num)
//            cur.removeLast()
//        }
//
//    }
//
//    backtrack([], 0)
//
//    return ans
//    }

//print(combine(4, 2))
