//
//  567. Permutation in String.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 3.9.2024.
//

import Foundation

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    if s1.count > s2.count {
        return false
    }
    
    let s1 = Array(s1.utf8)
    let s2 = Array(s2.utf8)
    var dic = [String.UTF8View.Element: Int]()
    var l = 0
    
    for char in s1 {
        dic[char, default: 0] += 1
    }
    
    var isSec = false
    for r in 0..<s2.count {
        if let val = dic[s2[r]] {
            if !isSec {
                isSec = true
                l = r
            }
            if val == 0 {
                while s2[l] != s2[r] {
                    if dic[s2[l]] != nil {
                        dic[s2[l]]! += 1
                        l += 1
                    }
                }
                
                dic[s2[l]]! += 1
                
                l += 1
            }
            
            dic[s2[r]]! -= 1
            
            if r - l + 1 == s1.count {
                return true
            }
        } else {
            if isSec {
                while l != r {
                    if dic[s2[l]] != nil {
                        dic[s2[l]]! += 1
                        l += 1
                    }
                }
            }
            isSec = false
        }
    }
    
    return false
}
//
//print(checkInclusion("ab", "eidbaooo"))
//
//print(checkInclusion("ab", "eidboaoo"))
//
//print(checkInclusion("adc", "dcda"))
//
//
//print(checkInclusion("hello", "ooolleoooleh"))
//
//print(checkInclusion("ky", "ainwkckifykxlribaypk"))
