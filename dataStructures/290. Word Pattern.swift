//
//  290. Word Pattern.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 5.9.2024.
//

import Foundation

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    var s = s.split(separator: " ")
    
    if s.count != pattern.count {
        return false
    }
    
    var dic = [String.UTF8View.Element: Substring]()
    let pattern = Array(pattern.utf8)
    var set = Set<Substring>()
    
    for i in 0..<pattern.count {
        if dic[pattern[i]] == nil {
            if set.contains(s[i]) {
                return false
            }
            dic[pattern[i]] = s[i]
            set.insert(s[i])
        } else if dic[pattern[i]]! != s[i] {
            return false
        }
    }
   
    return true
}

//print(wordPattern("abba", "dog cat cat dog"))

