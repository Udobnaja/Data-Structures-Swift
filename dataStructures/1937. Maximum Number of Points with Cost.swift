//
//  1937. Maximum Number of Points with Cost.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 17.8.2024.
//

import Foundation

// Time Limit Exceeded
//func maxPoints(_ points: [[Int]]) -> Int {
//    var ans = 0
//    var r_count = points.count
//    var c_count = points[0].count
//    var cache = Array(
//        repeating: Array(repeating: Array(repeating: -1, count: c_count), count: c_count), count: r_count)
//
//    func dp(_ r: Int, _ c: Int, _ prev: Int) -> Int {
//        if r >= r_count || c >= c_count {
//            return 0
//        }
//
//        if cache[r][c][prev] != -1 {
//           return cache[r][c][prev]
//        }
//
//        var sub = 0
//        if r > 0 {
//            sub = abs(prev - c)
//        }
//
//        cache[r][c][prev] = max(dp(r + 1, 0, c) + points[r][c] - sub, dp(r, c + 1, prev))
//
//        return cache[r][c][prev]
//    }
//
//    return dp(0, 0, 0)
//}
// Time Limit Exceeded
//func maxPoints(_ points: [[Int]]) -> Int {
//    var ans = 0
//    var r_count = points.count
//    var c_count = points[0].count
//    var cache = Array(
//        repeating: Array(repeating: Array(repeating: -1, count: c_count), count: c_count), count: r_count)
//
//    func dp(_ r: Int, _ c: Int, _ prev: Int) -> Int {
//        if r < 0 || c < 0 {
//            return 0
//        }
//
//        if cache[r][c][prev] != -1 {
//           return cache[r][c][prev]
//        }
//
//        var sub = 0
//        if r != r_count - 1 {
//            sub = abs(prev - c)
//        }
//
//        cache[r][c][prev] = max(dp(r - 1, c_count - 1, c) + points[r][c] - sub, dp(r, c - 1, prev))
//
//        return cache[r][c][prev]
//    }
//
//    return dp(r_count - 1, c_count - 1, c_count - 1)
//}

// Time Limit Exceeded
//func maxPoints(_ points: [[Int]]) -> Int {
//    var ans = 0
//    var r_count = points.count
//    var c_count = points[0].count
//    var cache = Array(
//        repeating: Array(repeating: -1, count: c_count), count: r_count)
//    func dp(_ r: Int, _ prev: Int) -> Int {
//        if r >= r_count {
//            return 0
//        }
//
//        if cache[r][prev] != -1 {
//           return cache[r][prev]
//        }
//
//        var inner = 0
//        for col in 0..<c_count {
//            var sub = 0
//            if r > 0 {
//                sub = abs(prev - col)
//            }
//            inner = max(
//                inner,
//                dp(r + 1, col) + points[r][col] - sub
//           )
//        }
//
//        cache[r][prev] = max(ans, inner)
//        return cache[r][prev]
//    }
//
//    return dp(0, 0)
//}

// Time Limit Exceeded
//func maxPoints(_ points: [[Int]]) -> Int {
//    var ans = 0
//    var r_count = points.count
//    var c_count = points[0].count
//    var cache = Array(
//        repeating: Array(repeating: -1, count: c_count), count: r_count)
//    func dp(_ r: Int, _ prev: Int) -> Int {
//        if r < 0 {
//            return 0
//        }
//
//        if cache[r][prev] != -1 {
//           return cache[r][prev]
//        }
//
//        var inner = 0
//        for col in 0..<c_count {
//            var sub = 0
//            if r != r_count - 1 {
//                sub = abs(prev - col)
//            }
//            inner = max(
//                inner,
//                dp(r - 1, col) + points[r][col] - sub
//           )
//        }
//
//        cache[r][prev] = max(ans, inner)
//        return cache[r][prev]
//    }
//
//    return dp(r_count - 1, c_count - 1)
//}

// good
//func maxPoints(_ points: [[Int]]) -> Int {
//    var ans = 0
//    var r_count = points.count
//    var c_count = points[0].count
//
//    var cache = Array(
//        repeating: Array(repeating: 0, count: c_count),
//        count: r_count
//    )
//
//    cache[0] = points[0]
//
//    for r in 1..<r_count {
//        for c in 0..<c_count {
//            let point = points[r][c]
//            var sum = 0
//            for prev_i in 0..<c_count {
//                let prev = cache[r - 1][prev_i]
//
//                sum = max(sum, point + prev - (abs(prev_i - c)))
//            }
//
//            cache[r][c] = sum
//        }
//    }
//
//    return cache[r_count - 1].max()!
//}

// less memory usage
func maxPoints(_ points: [[Int]]) -> Int {
    let r_count = points.count
    let c_count = points[0].count

    var cache = points[0]

    for r in 1..<r_count {
        var row = cache
        for c in 0..<c_count {
            let point = points[r][c]
            var sum = 0
            for prev_i in 0..<c_count {
                let prev = row[prev_i]

                sum = max(sum, point + prev - (abs(prev_i - c)))
            }

            cache[c] = sum
        }
    }

    return cache.max()!
}

// --------------------- //
// try solve it to O(N^2)
// --------------------- //

//print(maxPoints([[1,2,3],[1,5,1],[3,1,1]]))
//print(maxPoints([[1,5],[2,3],[4,2]]))
//print(maxPoints([[1,2],[3, 4]]))

// print(maxPoints([[2,4,0,5,5],[0,5,4,2,5],[2,0,2,3,1],[3,0,5,5,2]])) // 17
