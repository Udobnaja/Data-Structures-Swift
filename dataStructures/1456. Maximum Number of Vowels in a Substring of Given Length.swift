//
//  1456. Maximum Number of Vowels in a Substring of Given Length.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.8.2024.
//

import Foundation

//func maxVowels(_ s: String, _ k: Int) -> Int {
//    var res = 0
//    var fr = 0
//    let s = Array(s)
//    var l = 0
//
//    for r in 0..<s.count {
//        if s[r].isVowel {
//            res += 1
//        }
//
//        if res == k {
//            return res
//        }
//
//        if r - l + 1 == k {
//            fr = max(fr, res)
//            if s[l].isVowel {
//                res -= 1
//            }
//
//            l += 1
//        }
//    }
//
//    return fr
//}

//private extension Character {
//    var isVowel: Bool {
//        self == "a" || self == "e" || self == "i" || self == "o" || self == "u"
//    }
//}

// Faster bc eq?
func maxVowels(_ s: String, _ k: Int) -> Int {
    var res = 0
    var fr = 0
    let s = Array(s.utf8)
    var l = 0
    
    for r in 0..<s.count {
        if s[r].isVowel {
            res += 1
        }
            
        if res == k {
            return res
        }
        
        if r - l + 1 == k {
            fr = max(fr, res)
            if s[l].isVowel {
                res -= 1
            }
            
            l += 1
        }
    }
    
    return fr
}

private extension String.UTF8View.Element {
    var isVowel: Bool {
        self == 97 || self == 101 || self == 105 || self == 117 || self == 111
    }
}

//print(maxVowels("abciiidef", 3))

//print(maxVowels("aeiou",2))
//print(maxVowels("leetcode", 3))

