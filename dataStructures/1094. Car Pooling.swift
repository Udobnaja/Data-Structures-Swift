//
//  1094. Car Pooling.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.8.2024.
//

import Foundation

func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    var mx = 0
    
    for trip in trips {
        mx = max(mx, trip[2])
    }
    
    var arr = Array(repeating: 0, count: mx + 1)
    
    for trip in trips {
        arr[trip[1]] += trip[0]
        arr[trip[2]] -= trip[0]
    }
    
    if arr[0] > capacity {
        return false
    }
    
    for i in 1..<arr.count {
        arr[i] = arr[i] + arr[i - 1]
        
        if arr[i] > capacity {
            return false
        }
    }
    
    return true
}

//print(carPooling([[2,1,5],[3,3,7]], 4))

// print(carPooling([[9,0,1],[3,3,7]], 4))
