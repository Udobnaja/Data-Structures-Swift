//
//  1026. Maximum Difference Between Node and Ancestor.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 24.02.2024.
//

import Foundation

func maxAncestorDiff(_ root: TreeNode?) -> Int {
    func dfs(_ root: TreeNode?, mx: Int, mn: Int) -> Int {
        guard let root else {
            return mx - mn
        }

        let nmx = max(root.val, mx)
        let nmn = min(root.val, mn)
        let left = dfs(root.left, mx: nmx, mn: nmn)
        let right = dfs(root.right, mx: nmx, mn: nmn)

        return max(left, right)
    }

    guard let root else { return  0 }

    return dfs(root, mx: root.val, mn: root.val)
}
//maxAncestorDiff(root)
