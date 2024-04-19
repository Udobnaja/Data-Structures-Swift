//
//  BST.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.04.2024.
//

import Foundation

private func insertNode(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
        return TreeNode(val)
    }

    if val < root.val {
        root.left = insertNode(root.left, val)
    } else {
        root.right = insertNode(root.right, val)
    }

    return root
}

func createBST(from values: [Int?]) -> TreeNode? {
    var root: TreeNode? = nil
    for value in values where value != nil {
        root = insertNode(root, value!)
    }
    return root
}
