//
//  543. Diameter of Binary Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 24.02.2024.
//

import Foundation

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var d = 0
    func dfs(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        let left = dfs(root.left)
        let right = dfs(root.right)

        d = max(d, left + right)

        return max(left, right) + 1
    }

    dfs(root)

    return d
}

//print(diameterOfBinaryTree(root))
