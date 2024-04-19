//
//  1346. Check If N and Its Double Exist.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 20.03.2024.
//

import Foundation

func checkIfExist(_ arr: [Int]) -> Bool {
    var set = Set<Int>()

    for item in arr {
        if set.contains(item * 2) {
            return true
        }

        if item % 2 == 0, set.contains(item / 2) {
            return true
        }

        set.insert(item)
    }

    return false
}

//print(checkIfExist([3,1,7,11]))

