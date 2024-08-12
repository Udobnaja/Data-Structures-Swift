//
//  2540. Minimum Common Value.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.8.2024.
//

import Foundation

func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var l = 0
    var r = 0
    
    while l < nums1.count && r < nums2.count {
        if nums1[l] == nums2[r] {
            return nums1[l]
        }
        
        if nums1[l] < nums2[r] {
            l += 1
        } else {
            r += 1
        }
    }
    
    return -1
}

//print(getCommon([1,2,3], [2,4]))
//print(getCommon([1,2,3,6], [2,3,4,5]))
