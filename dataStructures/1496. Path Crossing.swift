//
//  1496. Path Crossing.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 14.8.2024.
//

import Foundation

func isPathCrossing(_ path: String) -> Bool {
    let path = Array(path.utf8)
    
    var coords = Set<[Int]>()
    
    coords.insert([0, 0])
    
    var cur = [0, 0]
    
    for c in path {
        switch c {
            case 78:
                cur[0] += 1
            case 87:
                cur[1] -= 1
            case 69:
                cur[1] += 1
            case 83:
                cur[0] -= 1
            default:
                break
        }
        
        if coords.contains(cur) {
            return true
        }
        
        coords.insert(cur)
    }
    
    return false
}

//print(isPathCrossing("NESWW"))

