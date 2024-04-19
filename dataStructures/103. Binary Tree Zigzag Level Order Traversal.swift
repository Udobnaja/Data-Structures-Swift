//
//  103. Binary Tree Zigzag Level Order Traversal.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.02.2024.
//

import Foundation

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root else { return [[Int]]() }

    var answ = [[Int]]()
    var q = [root]
    var level = 0

    while !q.isEmpty {
        let curLC = q.count
        var nextQ = [TreeNode]()
        var local = [Int]()
        level += 1

        for i in 0..<curLC {
            let node = q[i]
            let val = level%2 == 0 ? q[curLC - 1 - i].val : node.val
            local.append(val)

            if let left = node.left {
                nextQ.append(left)
            }

            if let right = node.right {
                nextQ.append(right)
            }
        }

        answ.append(local)
        q = nextQ
    }

    return answ
}

//print(zigzagLevelOrder(root))
