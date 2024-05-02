//
//  74. Search a 2D Matrix.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 2.5.2024.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let c_count = matrix[0].count
    var left = 0
    var right = matrix.count * c_count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        let r = mid / c_count
        let c = mid % c_count
        
        let v = matrix[r][c]
        if v == target {
            return true
        }
        
        if v > target {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return false
}

//print(searchMatrix([[1,3]], 3))
