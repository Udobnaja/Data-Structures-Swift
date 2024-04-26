//
//  881. Boats to Save People.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 26.04.2024.
//

import Foundation

func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
    var boat = 0

    var people = people

    people.sort(by: >)

    var left = 0
    var right = people.count - 1

    while left <= right {
        let first = people[left]
        let second = people[right]
        if first + second <= limit {
            right -= 1
        }

        boat += 1
        left += 1
    }

    return boat
}

// print(numRescueBoats([3,2,2,1], 3))
