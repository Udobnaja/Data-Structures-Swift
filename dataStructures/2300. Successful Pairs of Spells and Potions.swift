//
//  2300. Successful Pairs of Spells and Potions.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 3.5.2024.
//

import Foundation

func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
    
    let potions = potions.sorted()
    let p_count = potions.count
    var result = [Int]()
    
    for spell in spells {
        var l = 0
        var r = potions.count - 1
        while l <= r {
            let mid = (l + r) / 2

            if potions[mid] * spell < success {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        result.append(p_count - l)
    }
    
    return result
}

//print(successfulPairs([5,1,3], [1,2,3,4,5], 7))

//print(successfulPairs([3,1,2], [8,5,8], 16))
