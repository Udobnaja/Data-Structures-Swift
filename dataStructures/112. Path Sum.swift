//
//  112. Path Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 21.02.2024.
//

import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    func dfs(_ root: TreeNode?, prev: Int) -> Bool {
        if let root  {
            let acc = root.val + prev

            if acc == targetSum, root.left == nil, root.right == nil {
                return true
            }

            return dfs(root.left, prev: acc) || dfs(root.right, prev: acc)
        }

        return false
    }

    return dfs(root, prev: 0)
}

// print(hasPathSum(root, 22))
