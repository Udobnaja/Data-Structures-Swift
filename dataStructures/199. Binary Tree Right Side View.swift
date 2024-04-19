//
//  199. Binary Tree Right Side View.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 25.02.2024.
//

import Foundation

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root else { return [Int]() }
    var q = [root]
    var ans = [root.val]

    while !q.isEmpty {
        var curLL = q.count
        var nextLev = [TreeNode]()

        for i in 0..<curLL {
            let node = q[i]

            if let left = node.left {
                nextLev.append(left)
            }

            if let right = node.right {
                nextLev.append(right)
            }
        }

        if !nextLev.isEmpty {
            ans.append(nextLev[nextLev.count - 1].val)
        }

        q = nextLev
    }

    return ans
}

//print(rightSideView(root))

