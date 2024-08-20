//
//  650. 2 Keys Keyboard.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.8.2024.
//

import Foundation

// DP
//func minSteps(_ n: Int) -> Int {
//    var cache = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: n), count: n)
//    func dp(_ cur: Int, _ toCopy: Int, _ canPaste : Bool) -> Int {
//        if cur == n {
//            return 0
//        }
//
//        if cur > n || cur + toCopy > n {
//            return cur + toCopy
//        }
//
//        let key = canPaste ? 0 : 1
//
//        if cache[cur][toCopy][key] != -1 {
//            return cache[cur][toCopy][key]
//        }
//
//        if !canPaste {
//            cache[cur][toCopy][key] = dp(cur, cur, true) + 1
//            return cache[cur][toCopy][key]
//        } else {
//            cache[cur][toCopy][key] = min(dp(cur + toCopy, toCopy, true), dp(cur + toCopy, toCopy, false)) + 1
//            return cache[cur][toCopy][key]
//        }
//    }
//
//    return dp(1, 1, false)
//}

// a bit faster DP
//func minSteps(_ n: Int) -> Int {
//    if n == 1 {
//        return 0
//    }
//    var cache = Array(repeating: Array(repeating: -1, count: n), count: n)
//    func dp(_ cur: Int, _ toCopy: Int) -> Int {
//        if cur == n {
//            return 0
//        }
//
//        if cur > n || cur + toCopy > n {
//            return cur + toCopy
//        }
//
//
//        if cache[cur][toCopy] != -1 {
//            return cache[cur][toCopy]
//        }
//
//        cache[cur][toCopy] = min(
//            dp(cur + toCopy, toCopy) + 1,
//            dp(cur + toCopy, cur + toCopy) + 2)
//
//        return cache[cur][toCopy]
//    }
//
//    return dp(1, 1) + 1
//}


// Way Better
func minSteps(_ n: Int) -> Int {
    var count = n
    var ans = 0
    while count != 1 {
        if count % 2 == 0 { // test for exp 24
            count = count / 2
            ans += 2
        } else {
            if count == 3 {
                count = 1
                ans += 3
            } else {
                var temp = count
                for i in 3..<(count) { // test 9 or 35
                    if count % i == 0 {
                        count /= i
                        ans += i
                        break
                    }
                }
                
                if temp == count { // numbers as 7 or 11 etc
                    ans += count
                    return ans
                }
            }
        }
    }
    
    return ans
}

//print(minSteps(3)) // 3)
//
//print(minSteps(7)) // 7)
////
//print(minSteps(9)) // 6)
//print(minSteps(24)) // 9)
//////
//print(minSteps(124)) // 35)
//////
//print(minSteps(6)) // 5)
//print(minSteps(27)) // 9)
//print(minSteps(35)) // 12)
