//
//  217. Contains Duplicate.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 14.8.2024.
//

import Foundation

// memory save
//func containsDuplicate(_ nums: [Int]) -> Bool {
//    !(Set(nums).count == nums.count)
//}

func containsDuplicate(_ nums: [Int]) -> Bool {
    var dic = [Int: Int]()
    for num in nums {
        if let value = dic[num] {
            return true
        }
        
        dic[num] = 0
    }
    
    return false
}
