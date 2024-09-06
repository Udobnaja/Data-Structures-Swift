//
//  791. Custom Sort String.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 6.9.2024.
//

import Foundation

func customSortString(_ order: String, _ s: String) -> String {
    let order = Array(order.utf8)
    let s = Array(s.utf8)
    var dic = [String.UTF8View.Element: Int]()
    
    for char in s {
        dic[char, default: 0] += 1
    }
    
    var ans = [String.UTF8View.Element]()
    
    for el in order {
        if let count = dic[el] {
            ans += Array(repeating: el, count: count)
            dic[el] = nil
        }
    }
    
    for (el, count) in dic {
        ans += Array(repeating: el, count: count)
    }
    
    return String(bytes: ans, encoding: .utf8)!
}

//print(customSortString("cba", "abcd"))
