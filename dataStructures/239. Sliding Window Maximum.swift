//
//  239. Sliding Window Maximum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 11.02.2024.
//

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var answers = [Int]()
    var queue = [Int]()

    for i in 0..<nums.count {
        if !queue.isEmpty && i - queue[0] == k {
            queue.removeFirst()
        }

        while !queue.isEmpty && nums[i] >= nums[queue[queue.count - 1]] {
            queue.removeLast()
        }

        queue.append(i)

        if i >= k - 1 {
            answers.append(nums[queue[0]])
        }
    }

    return answers
}
//print(maxSlidingWindow([-1, 1], 1)) // [3,3,3,5,5,6,7] // [3,3,5,5,6,7]

// 1
// [1,3,-1,-3,5,3,6,7], 3

//

/*
 вшли за границу
 3, -1, -3
 3, -1
 3 (kil 1)
1,

 предыдущий и следующий - если левое число

*/

      // [1, 3, -1, -3, 5, 3, 6, 7], 3 // [1, 3, 5, 5, 6, 7]
    // [7,2,4] , 2 = [7,4]
// [1,-1], 1

// 3,

//  [7, 3, 4, 2, 2, 6, 5, 9, 2, 0]

// [1, 2, 3, 2, 1, 8, 5, 6]

// 3 (2 i)
// (Curindex >= i || Curindex <= j)




//func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//    var answers = [Int]()
//    var stack = [Int]()
//    var leftI = 0
//    var rightI = k - 1
//
//    while rightI < nums.count {
//        if stack.isEmpty || stack[stack.count - 1] < leftI {
//            stack.append(leftI)
//            var l = leftI + 1
//            while l <= rightI {
//                if nums[stack[stack.count - 1]] < nums[l] {
//                    stack.removeLast()
//                    stack.append(l)
//                }
//
//                l += 1
//            }
//        } else {
//            let lastMaxIndx = stack[stack.count - 1]
//            if nums[rightI] < nums[lastMaxIndx] {
//                stack.append(lastMaxIndx)
//            } else {
//                stack.append(rightI)
//            }
//        }
//
//        leftI += 1
//        rightI += 1
//    }
//
//    return stack.map { nums[$0] }
//}
//print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))


