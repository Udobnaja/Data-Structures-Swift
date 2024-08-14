//
//  1436. Destination City.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 14.8.2024.
//

import Foundation

//func destCity(_ paths: [[String]]) -> String {
//    var dic = [String: String]()
//
//    for path in paths {
//        dic[path[0]] = path[1]
//    }
//    var key = paths[0][0]
//
//    while dic[key] != nil {
//        key = dic[key]!
//    }
//
//    return key
//}

//func destCity(_ paths: [[String]]) -> String {
//    var keys = Set<String>()
//    var dest = Set<String>()
//
//    for path in paths {
//        keys.insert(path[0])
//        dest.insert(path[1])
//    }
//
//    for d in dest {
//        if !keys.contains(d) {
//            return d
//        }
//    }
//    return ""
//}

func destCity(_ paths: [[String]]) -> String {
    var keys = Set<String>()
    var dest = Set<String>()
    
    for path in paths {
        keys.insert(path[0])
        dest.insert(path[1])
    }
    
    return dest.subtracting(keys).first!
}

//
//print(destCity([["A","Z"]]))
//
//print(destCity([["B","C"],["D","B"],["C","A"]]))
//
//print(destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
