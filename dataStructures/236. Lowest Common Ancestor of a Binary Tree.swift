//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 23.02.2024.
//

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root else { return nil }

    if root.val == p?.val || root.val == q?.val {
        return root
    }

    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)

    if let left, let right { return root }

    if let left { return left }

    return right
}

//print(lowestCommonAncestor(root, left, right)?.val)
