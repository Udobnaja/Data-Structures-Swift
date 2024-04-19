//
//  515. Find Largest Value in Each Tree Row.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 25.02.2024.
//

import Foundation

func largestValues(_ root: TreeNode?) -> [Int] {
    var a = [Int]()
    guard let root else { return a }

    var q = [root]

    while !q.isEmpty {
        let curLL = q.count
        var nextLQ = [TreeNode] ()

        var curMax = Int.min

        for i in 0..<curLL {
            let node = q[i]

            if node.val > curMax {
                curMax = node.val
            }

            if let left = node.left {
                nextLQ.append(left)
            }

            if let right = node.right {
                nextLQ.append(right)
            }
        }

        q = nextLQ

        a.append(curMax)
    }

    return a
}

//print(largestValues(root))

