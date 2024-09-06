//
//  205. Isomorphic Strings.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 4.9.2024.
//

import Foundation

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var dic = [String.UTF8View.Element: String.UTF8View.Element]()
    let s = Array(s.utf8)
    let t = Array(t.utf8)
    var set: Set<String.UTF8View.Element> = []
    for i in 0..<s.count {
        if dic[s[i]] == nil {
            if set.contains(t[i]) {
                return false
            }
            set.insert(t[i])
            dic[s[i]] = t[i]
        } else if dic[s[i]] != t[i] {
            return false
        }
    }
    
    return true
}

//print(isIsomorphic("egg", "add"))
//
//print(isIsomorphic("foo", "bar"))
//
//print(isIsomorphic("paper", "title"))
//
//print(isIsomorphic("badc", "baba"))
