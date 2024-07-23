//
//  1143. Longest Common Subsequence.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 23.7.2024.
//

import Foundation

//func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
//    let text1 = Array(text1)
//    let text2 = Array(text2)
//
//    var cache = Array(repeating: Array(repeating: -1, count: text2.count + 1), count: text1.count + 1)
//    func dp(_ i: Int, _ j: Int) -> Int {
//        if i == text1.count || j == text2.count {
//            return 0
//        }
//        let ni = i + 1
//        let nj = j + 1
//
//        if text1[i] == text2[j] {
//            if cache[ni][nj] == -1 {
//                cache[ni][nj] = dp(ni, nj)
//            }
//            return cache[ni][nj] + 1
//        } else {
//            if cache[i][nj] == -1 {
//                cache[i][nj] = dp(i, nj)
//            }
//
//            if cache[ni][j] == -1 {
//                cache[ni][j] = dp(ni, j)
//            }
//            return max(cache[i][nj], cache[ni][j])
//        }
//    }
//
//    return dp(0, 0)
//}

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    var storage = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
    
    let text1 = Array(text1)
    let text2 = Array(text2)
    var i = text1.count - 1
    
    while i >= 0 {
        
        var j = text2.count - 1
        
        while j >= 0 {
            
            if text1[i] == text2[j] {
                storage[i][j] = 1 + storage[i + 1][j + 1]
            } else {
                storage[i][j] = max(storage[i][j + 1], storage[i + 1][j])
            }
            
            j -= 1
        }
        
        i -= 1
    }
    
    return storage[0][0]
}

//print(longestCommonSubsequence("abcde", "ace"))

