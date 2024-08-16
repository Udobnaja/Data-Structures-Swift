//
//  451. Sort Characters By Frequency.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 16.8.2024.
//

import Foundation

//func frequencySort(_ s: String) -> String {
//    let s = Array(s.utf8)
//    var dic = [String.UTF8View.Element: (Int, String.UTF8View.Element)]()
//    for char in s {
//        var val = dic[char] ?? (0, char)
//        val.0 += 1
//        dic[char] = val
//    }
//
//    let g = dic.values.sorted { $0.0 > $1.0 }
//    var n = [String.UTF8View.Element]()
//    for pair in g {
//        n += Array(repeating: pair.1, count: pair.0)
//    }
//
//    return String(bytes: n, encoding: .utf8)!
//}

 // I guess it's slower than the previous solution because I sort the whole dictionary
func frequencySort(_ s: String) -> String {
    let s = Array(s.utf8)
    var dic = [String.UTF8View.Element: Int]()
    for char in s {
        dic[char, default: 0] += 1
    }
    
    let sortedD = dic.sorted { $0.value > $1.value }
    var n = [String.UTF8View.Element]()
    for (char, count) in sortedD {
        n += Array(repeating: char, count: count)
    }
    
    return String(bytes: n, encoding: .utf8)!
}

//print(frequencySort("tree"))
