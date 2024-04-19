//
//  1448. Count Good Nodes in Binary Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 22.02.2024.
//

import Foundation

func goodNodes(_ root: TreeNode?) -> Int {
    func dfs(_ root: TreeNode?, prev: Int) -> Int {
        guard let root else { return 0 }
        var count = 0

        if root.val >= prev {
           count += 1
        }

        count += dfs(root.right, prev: max(root.val, prev))
        count += dfs(root.left, prev: max(root.val, prev))

        return count

    }
    return dfs(root, prev: Int.min)
}

//print(goodNodes(root))
