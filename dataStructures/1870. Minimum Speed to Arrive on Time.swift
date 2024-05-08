//
//  1870. Minimum Speed to Arrive on Time.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 8.5.2024.
//

import Foundation

func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
    if dist.count > Int(ceil(hour)) {
        return -1
    }
    
    func check(_ s: Int) -> Bool {
        var time = 0.0
        
        for d in dist {
            time = ceil(time)
            time += Double(d) / Double(s)
            
            if time > hour {
                return false
            }
        }
        
        return time <= hour
    }
    
    var left = 1
    var right = Int(pow(10.0, 7.0))
    

    while left <= right {
        let mid = (left + right) / 2
        
        if check(mid) {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return left
}

//print(minSpeedOnTime([1,3,2], 2.7))
