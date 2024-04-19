//
//  98. Validate Binary Search Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 29.02.2024.
//

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root else { return false }
    func dfs(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        guard let root else { return true }

        if root.val <= min || root.val >= max {
            return false
        }

        return dfs(root.left, min: min, max: root.val) && dfs(root.right, min: root.val, max: max)
    }

    return dfs(root, min: Int.min, max: Int.max)
}

//print(isValidBST(root))
