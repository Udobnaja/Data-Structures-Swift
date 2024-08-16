//
//  624. Maximum Distance in Arrays.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 16.8.2024.
//

import Foundation

// Time Limit Exceeded
//func maxDistance(_ arrays: [[Int]]) -> Int {
//    var ans = 0
//
//    for i in 0..<arrays.count - 1 {
//        var from = arrays[i][0]
//        var to = arrays[i][arrays[i].count - 1]
//
//        for j in i+1..<arrays.count {
//            let array = arrays[j]
//            let fr = array[0]
//            let t = array[array.count - 1]
//
//            ans = max(ans, t - from, to - fr)
//        }
//    }
//
//    return ans
//}

//func maxDistance(_ arrays: [[Int]]) -> Int {
//    var first_minimum = arrays[0][0]
//    var second_maximum = arrays[1][arrays[1].count - 1]
//
//    var second_minimum = arrays[1][0]
//    var first_maximum = arrays[0][arrays[0].count - 1]
//
//    if arrays.count == 2 {
//        return max(abs(first_maximum - second_minimum), abs(second_maximum - first_minimum))
//    }
//
//    // print("F", [first_minimum, second_maximum], [second_minimum, first_maximum])
//
//    for i in 2..<arrays.count {
//        let first_element = arrays[i][0]
//        let last_element = arrays[i][arrays[i].count - 1]
//
//        let last_element_minus_first_minumum = abs(last_element - first_minimum)
//        let last_element_minus_second_minimum = abs(last_element - second_minimum)
//        let second_maximum_minus_first_element = abs(second_maximum - first_element)
//        let first_maximum_minus_first_element = abs(first_maximum - first_element)
//
//        if second_maximum_minus_first_element > first_maximum_minus_first_element {
//            if last_element_minus_first_minumum > last_element_minus_second_minimum {
//                if second_maximum_minus_first_element > last_element_minus_first_minumum {
//                    first_minimum = min(first_minimum, first_element)
//                    first_maximum = max(first_maximum, last_element)
//                } else {
//                    second_maximum = max(last_element, second_maximum)
//                    second_minimum = min(second_minimum, first_element)
//                }
//            } else {
//                if second_maximum_minus_first_element > last_element_minus_second_minimum {
//                    first_minimum = min(first_minimum, first_element)
//                    first_maximum = max(first_maximum, last_element)
//                } else {
//                    first_maximum = max(first_maximum, last_element)
//                    first_minimum = min(first_minimum, first_element)
//                }
//            }
//        } else {
//            if last_element_minus_first_minumum > last_element_minus_second_minimum {
//                if first_maximum_minus_first_element > last_element_minus_first_minumum {
//                    second_minimum = min(second_minimum, first_element)
//                    second_maximum = max(second_maximum, last_element)
//                } else {
//                    second_maximum = max(second_maximum, last_element)
//                    second_minimum = min(second_minimum, first_element)
//                }
//            } else {
//                if first_maximum_minus_first_element > last_element_minus_second_minimum {
//                    second_minimum = min(first_element, second_minimum)
//                    second_maximum = max(second_maximum, last_element)
//                } else {
//                    first_maximum = max(first_maximum, last_element)
//                    first_minimum = min(first_element, first_minimum)
//                }
//            }
//        }
////        print([first_minimum, second_maximum], [second_minimum, first_maximum])
//    }
//
//    return max(abs(first_maximum - second_minimum), abs(second_maximum - first_minimum))
//}

func maxDistance(_ arrays: [[Int]]) -> Int {
    var first_minimum = arrays[0][0]
    var second_maximum = arrays[1][arrays[1].count - 1]
    
    var second_minimum = arrays[1][0]
    var first_maximum = arrays[0][arrays[0].count - 1]
    
    if arrays.count == 2 {
        return max(abs(first_maximum - second_minimum), abs(second_maximum - first_minimum))
    }
    
    for i in 2..<arrays.count {
        let first_element = arrays[i][0]
        let last_element = arrays[i][arrays[i].count - 1]

        let max_diff1 = max(abs(first_maximum - first_element), abs(second_maximum - first_element))
        let max_diff2 = max(abs(last_element - first_minimum), abs(last_element - second_minimum))
        
        if max_diff1 > max_diff2 {
            if abs(first_maximum - first_element) > abs(second_maximum - first_element) {
                second_minimum = min(second_minimum, first_element)
                second_maximum = max(second_maximum, last_element)
            } else {
                first_minimum = min(first_minimum, first_element)
                first_maximum = max(first_maximum, last_element)
            }
            
        } else {
            if abs(last_element - first_minimum) > abs(last_element - second_minimum) {
                second_minimum = min(second_minimum, first_element)
                second_maximum = max(second_maximum, last_element)
            } else {
                first_minimum = min(first_minimum, first_element)
                first_maximum = max(first_maximum, last_element)
            }
        }
    }
    
    return max(abs(first_maximum - second_minimum), abs(second_maximum - first_minimum))
}

//print(maxDistance([[1],[1]]))
//
//print(maxDistance([
//    [-8,-7,-7,-5,1,1,3,4],
//    [-2],
//    [-10,-10,-7,0,1,3],
//    [2]
//]))
//
//print(maxDistance([[1,2,3],[4,5],[1,2,3]]))
//
//print(maxDistance([[-1,1],[-3,1,4],[-2,-1,0,2]])) //6

//-4 - 10
// = 14
// 14
//1, 4 -1, 10
//-1, 10, 1, 4
//1, 4 , 3,7
//1, 10
