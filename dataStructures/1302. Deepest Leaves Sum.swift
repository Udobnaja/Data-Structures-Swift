//
//  1302. Deepest Leaves Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.02.2024.
//

import Foundation

func deepestLeavesSum(_ root: TreeNode?) -> Int {
    var answ = 0
    guard let root else { return answ }

    var q = [root]

    while !q.isEmpty {
        let curLL = q.count
        var nextQL = [TreeNode]()
        answ = 0
        for i in 0..<curLL {
            let node = q[i]

            if let left = node.left {
                nextQL.append(left)
            }

            if let right = node.right {
                nextQL.append(right)
            }

            answ += node.val
        }

        q = nextQL
    }

    return answ
}

//print(deepestLeavesSum(root))
