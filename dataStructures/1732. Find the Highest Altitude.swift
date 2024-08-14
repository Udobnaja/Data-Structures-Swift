//
//  1732. Find the Highest Altitude.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.8.2024.
//

import Foundation

func largestAltitude(_ gain: [Int]) -> Int {
    var res = 0
    var dist = 0
    for alt in gain {
        dist += alt
        res = max(res, dist)
    }
    
    return res
}

//print(largestAltitude([-5,1,5,0,-7]))
//print(largestAltitude([-4,-3,-2,-1,4,3,2]))
