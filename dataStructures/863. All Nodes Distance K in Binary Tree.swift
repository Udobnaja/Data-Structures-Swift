//
//  863. All Nodes Distance K in Binary Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 14.03.2024.
//

import Foundation

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    guard let root, let target else {
        return [Int]()
    }

    var graph = [Int: [Int]]()

    var q = [root]

    while !q.isEmpty {
        let qL = q.count
        var newQ = [TreeNode]()

        for i in 0..<qL {
            let node = q[i]

            if let left = node.left {
                newQ.append(left)
                graph[node.val, default: []].append(left.val)
                graph[left.val, default: []].append(node.val)
            }

            if let right = node.right {
                newQ.append(right)
                graph[node.val, default: []].append(right.val)
                graph[right.val, default: []].append(node.val)
            }
        }

        q = newQ
    }

    guard var q = graph[target.val] else {
        return [Int]()
    }

    var seen: Set = [target.val]
    var level = 0
    var ans = [Int]()

    if k == 0 {
        ans.append(target.val)
        return ans
    }

    while level != k {
        var newQ = [Int] ()
        for key in q {
            guard !seen.contains(key) else { continue }
            seen.insert(key)
            if let arr = graph[key] {
                newQ += arr
            }
            if level == k - 1 {
                ans.append(key)
            }
        }

        level += 1
        q = newQ
    }

    return  ans
}

// print(distanceK(createTree(from: [0,1,nil,nil,2,nil,3,nil,4]), TreeNode(3), 0))
