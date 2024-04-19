//
//  414. Third Maximum Number.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 01.04.2024.
//

import Foundation

func thirdMax(_ nums: [Int]) -> Int {
    var max_1 = Int.min
    var max_2 = Int.min
    var max_3 = Int.min
    for num in nums {
        if num > max_1 {
            max_3 = max_2
            max_2 = max_1
            max_1 = num
        } else if num > max_2 && num != max_1 {
            max_3 = max_2
            max_2 = num
        } else if num > max_3 && num != max_2 && num != max_1 {
            max_3 = num
        }

    }

    return max_3 == Int.min ? max_1 : max_3
}

//print(thirdMax([1,2,2,5,3,5]))

