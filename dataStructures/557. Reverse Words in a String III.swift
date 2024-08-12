//
//  557. Reverse Words in a String III.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.8.2024.
//

import Foundation

//func reverseWords(_ s: String) -> String {
//    var originalStr = Array(s)
//    var l = 0
//    let count = originalStr.count
//    for i in 0..<originalStr.count {
//        if originalStr[i].isWhitespace || i == count - 1 {
//            var r = i == count - 1 ? i : i - 1
//            while l < r {
//                originalStr.swapAt(l, r)
//                l += 1
//                r -= 1
//            }
//
//            l = i + 1
//        }
//    }
//
//    return String(originalStr)
//}

//func reverseWords(_ s: String) -> String {
//    var originalStr = Array(s)
//    let count = originalStr.count
//    var l = 0
//    var r = (originalStr.firstIndex(of: " ") ?? count) - 1
//    var oldR = r
//
//    while l <= r {
//        originalStr.swapAt(l, r)
//        l += 1
//        r -= 1
//
//        print(l, r)
//        if l >= r && oldR != count - 1 {
//            l = oldR + 2
//            r = (originalStr[l...].firstIndex(of: " ") ?? count) - 1
//            oldR = r
//        }
//    }
//
//    return String(originalStr)
//}

func reverseWords(_ s: String) -> String {
    var originalStr = Array(s.utf8)
    var l = 0
    let count = originalStr.count
    for i in 0..<originalStr.count {
        if originalStr[i] == 32 || i == count - 1 {
            var r = i == count - 1 ? i : i - 1
            while l < r {
                originalStr.swapAt(l, r)
                l += 1
                r -= 1
            }

            l = i + 1
        }
    }

    return String(bytes: originalStr, encoding: .utf8)!
}

//print(reverseWords("Let's take LeetCode contest"))
//print(reverseWords("I love u"))

