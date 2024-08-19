//
//  264. Ugly Number II.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.8.2024.
//

import Foundation

//func nthUglyNumber(_ n: Int) -> Int {
//    var tw = MaxHeap<Int>()
//    var th = MaxHeap<Int>()
//    var fv = MaxHeap<Int>()
//    var set: Set<Int> = [-1, -2, -3, -5]
//
//    tw.insert(-2)
//    th.insert(-3)
//    fv.insert(-5)
//
//    var smth = [1]
//
//    while smth.count < n {
//        let cur_heap: MaxHeap<Int>
//        let tw_min = tw.peek() ?? 0
//        let th_min = th.peek() ?? 0
//        let fv_min = fv.peek() ?? 0
//        if tw_min > th_min && tw_min > fv.peek()! {
//            cur_heap = tw
//
//        } else if th_min > tw_min && th_min > fv_min {
//            cur_heap = th
//        } else if fv_min > tw_min && fv_min > th_min {
//            cur_heap = fv
//        } else {
//            if fv_min == tw_min &&  fv_min == th_min {
//                cur_heap = fv
//                tw.remove()
//                th.remove()
//            } else if tw_min == th_min {
//                cur_heap = tw
//                th.remove()
//            } else if tw_min == fv_min {
//                cur_heap = tw
//                fv.remove()
//            } else {
//                cur_heap = th
//                fv.remove()
//            }
//        }
//        let number = cur_heap.remove()!
//        smth.append(number * -1)
//        for num in [2, 3, 5] {
//            let counted = num * number
//            if !set.contains(counted) {
//                cur_heap.insert(counted)
//                set.insert(counted)
//            }
//
//        }
//    }
//
//    return smth[n - 1]
//}

func nthUglyNumber(_ n: Int) -> Int {
    var ans = [1]
    
    var tw_i = 0
    var th_i = 0
    var fv_i = 0
    
    while ans.count < n {
        let num = min(ans[tw_i] * 2, ans[th_i] * 3, ans[fv_i] * 5)
        ans.append(num)
        if ans[tw_i] * 2 == num { tw_i += 1 }
        if ans[th_i] * 3 == num { th_i += 1 }
        if ans[fv_i] * 5 == num { fv_i += 1 }
    }
    
    return ans[n - 1]
}

//print(nthUglyNumber(130)) // 1690
