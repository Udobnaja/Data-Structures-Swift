//
//  104. Maximum Depth of Binary Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 20.02.2024.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
}

//print(maxDepth(root))
