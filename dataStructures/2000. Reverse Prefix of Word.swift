//
//  2000. Reverse Prefix of Word.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.8.2024.
//

import Foundation

func reversePrefix(_ word: String, _ ch: Character) -> String {
    var originalStr = Array(word)
    var l = 0
    
    for i in 0..<originalStr.count {
        if originalStr[i] == ch {
            var r = i
            while l < r {
                originalStr.swapAt(l, r)
                l += 1
                r -= 1
            }
            break
        }
    }

    return String(originalStr)
}

//func reversePrefix(_ word: String, _ ch: Character) -> String {
//    var originalStr = Array(word.utf8)
//    var l = 0
//
//    for i in 0..<originalStr.count {
//        if originalStr[i] == String(ch).utf8.first! {
//            var r = i
//            while l < r {
//                originalStr.swapAt(l, r)
//                l += 1
//                r -= 1
//            }
//            break
//        }
//    }
//
//    return String(bytes: originalStr, encoding: .utf8)!
//}

//func reversePrefix(_ word: String, _ ch: Character) -> String {
//    var originalStr = Array(word.utf8)
//
//    var r = originalStr.firstIndex(of: String(ch).utf8.first!) ?? Int.min
//    var l = 0
//    while l < r {
//        originalStr.swapAt(l, r)
//        l += 1
//        r -= 1
//    }
//
//    return String(bytes: originalStr, encoding: .utf8)!
//}

//func reversePrefix(_ word: String, _ ch: Character) -> String {
//    var originalStr = Array(word)
//
//    var r = originalStr.firstIndex(of: ch) ?? Int.min
//    var l = 0
//    while l < r {
//        originalStr.swapAt(l, r)
//        l += 1
//        r -= 1
//    }
//
//    return String(originalStr)
//}

//print(reversePrefix("abcdefd", "d"))
//print(reversePrefix("xyxzxe", "z"))
