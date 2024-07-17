//
//  70. Climbing Stairs.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 17.7.2024.
//

import Foundation

// tb
//func climbStairs(_ n: Int) -> Int {
//    var arr = Array(repeating: -1, count: n + 1)
//    func dp(_ s: Int) -> Int {
//        if s <= 0 {
//            if s == 0 {
//                return 1
//            }
//            return 0
//        }
//        if arr[s] == -1 {
//            arr[s] = dp(s - 1) + dp(s - 2)
//        }
//
//        return arr[s]
//    }
//
//    return dp(n)
//}


// BT
func climbStairs(_ n: Int) -> Int {
    if n <= 2 {
        return n
    }
    var arr = [1, 2]
    for i in 2..<n {
        arr.append((arr[i-1] + arr[i-2]))
    }
    
    return arr[n - 1]
}


//climbStairs(2)
//print(climbStairs(3))
