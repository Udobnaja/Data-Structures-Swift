//
//  1207. Unique Number of Occurrences.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.8.2024.
//

import Foundation

//func uniqueOccurrences(_ arr: [Int]) -> Bool {
//    var dic = [Int: Int]()
//    for num in arr {
//        dic[num, default: 0] += 1
//    }
//
//    return dic.values.count == Set(dic.values).count
//}

func uniqueOccurrences(_ arr: [Int]) -> Bool {
    var dic = [Int: Int]()
    for num in arr {
        dic[num, default: 0] += 1
    }
    var set = Set<Int>()
    
    for fr in dic.values {
        if set.contains(fr) {
            return false
        }
           
        set.insert(fr)
    }
    
    return true
}

// print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]))
