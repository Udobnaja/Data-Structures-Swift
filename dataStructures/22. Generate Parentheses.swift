//
//  22. Generate Parentheses.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 13.6.2024.
//

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    
    func b(_ str: String, _ l: Int, _ r: Int) {
        guard str.count != n * 2 else {
            result.append(str)
            return
        }
        
        if l < n { b(str + "(", l + 1, r) }
        
        if l > r { b(str + ")", l, r + 1) }
    }
    
    b("", 0, 0)
    
    return result
}

//func generateParenthesis(_ n: Int) -> [String] {
//    var ex = [String](repeating: "(", count: n) + [String](repeating: ")", count: n)
//
//    let str = ex.joined()
//    var result = [str]
//    var s:Set<String> = [str]
//    var secret_set:Set<String> = [str]
//
//    func b(_ i: Int, _ ex: [String]) {
//        guard i < ex.count - 1 else { return }
//
//        for z in i+1..<ex.count - 1 {
//            var ex = ex
//            let j = ex[i]
//            let f = ex[z]
//            ex[i] = f
//            ex[z] = j
//
//            if isValid(ex) {
//                let f_j = ex.joined()
//
//                if !s.contains(f_j) {
//                    s.insert(f_j)
//                    result.append(f_j)
//                }
//
//                if !secret_set.contains("\(f_j)_\(i)_\(z)") {
//                    secret_set.insert("\(f_j)_\(i)_\(z)")
//                    b(i + 1, ex)
//                }
//
//            }
//        }
//    }
//
//    b(1, ex)
//
//    func isValid(_ str: [String]) -> Bool {
//        var s = [String]()
//        for i in 0..<str.count {
//            if str[i] == ")" && !s.isEmpty && s[s.count - 1] == "(" {
//                s.removeLast()
//            } else {
//                s.append(str[i])
//            }
//        }
//        return s.isEmpty
//    }
//
//    return result
//}

//let r = generateParenthesis(4)
//print(r, r.count)

//4 - 14

//(()())()
//(())(())
//()(()())
//()(())()

//["(((())))","((()()))","((())())","((()))()","(()(()))","(()()())","(()())()","(())(())","(())()()","()((()))","()(()())","()(())()","()()(())","()()()()"].forEach { m in
//        if !s.contains(m) {
//            print("new", m)
//        }
//    }

//799
// 883

