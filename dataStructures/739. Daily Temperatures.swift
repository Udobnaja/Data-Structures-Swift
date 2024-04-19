//
//  739. Daily Temperatures.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 11.02.2024.
//

import Foundation

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var answers = [Int](repeating: 0, count: temperatures.count)
    var stack = [Int]()

    for (index, temp) in temperatures.enumerated() {
        while !stack.isEmpty && temperatures[stack[stack.count - 1]] < temp {
            if let j = stack.popLast() {
                answers[j] = index - j
            }
        }

        stack.append(index)
    }

    return answers
}

// print(dailyTemperatures([73,74,75,71,69,72,76,73]))

// 0, 73 | S: [0]
// 1, 74 | S: [1] | A: [1]
// 2, 75 | S: [2] | A: [1, 1]
// 3, 71 | S: [2, 3] | A: [1, 1]
// 4, 69 | S: [2, 3, 4] | A: [1, 1]
// 5, 72 | S: [2, 5]    | A: [1, 1, , 2, 1]
// 6, 76 | S: [6]  | A: [1, 1, 4, 2, 1, 1]
// 7, 73 | S: [6, 7] | A: [1, 1, 4, 2, 1, 1]
