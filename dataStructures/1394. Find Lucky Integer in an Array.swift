//
//  1394. Find Lucky Integer in an Array.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.8.2024.
//

import Foundation

//func findLucky(_ arr: [Int]) -> Int {
//    var dic = [Int: Int]()
//
//    for num in arr {
//        dic[num, default: 0] += 1
//    }
//    var mx = -1
//
//    for (key, value) in dic {
//        if key == value {
//            mx = max(mx, key)
//        }
//    }
//
//    return mx
//}

func findLucky(_ arr: [Int]) -> Int {
    var dic = [Int: Int]()
    var set:Set<Int> = [-1]
    for num in arr {
        dic[num, default: 0] += 1
        if dic[num] == num {
            set.insert(num)
        } else if dic[num]! > num {
            set.remove(num)
        }
    }
    
    return set.max()!
}

//print(findLucky([2,2,3,4]))
