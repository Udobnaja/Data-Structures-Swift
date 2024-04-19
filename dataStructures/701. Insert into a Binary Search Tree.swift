//
//  701. Insert into a Binary Search Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 02.03.2024.
//

import Foundation

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root else { return TreeNode(val) }
    var inserted = false

    func dfs(_ root: TreeNode?, _ val: Int) {
        guard let root else { return }
        guard !inserted else { return }

        if root.val > val {
            if let left = root.left {
                dfs(left, val)
            } else {
                inserted = true
                root.left = TreeNode(val)
            }
        }

        if root.val < val {
            if let right = root.right {
                dfs(right, val)
            } else {
                inserted = true
                root.right = TreeNode(val)
            }
        }
    }

    dfs(root, val)

    return root
}

//print(insertIntoBST(root, 5))
