//
//  208. Implement Trie (Prefix Tree).swift
//  dataStructures
//
//  Created by Anna Udobnaja on 17.8.2024.
//

import Foundation

//class Trie {
//    var children = [Character: Trie]()
//    var w = Set<String>()
//    init() {}
//
//    func insert(_ word: String) {
//        var cur = self
//        var pref = ""
//        for char in Array(word) {
//            pref += String(char)
//            if cur.children[char] == nil {
//                cur.children[char] = Trie()
//            }
//
//            cur = cur.children[char]!
//        }
//
//        cur.w.insert(word)
//    }
//
//    func search(_ word: String) -> Bool {
//        var cur = self
//        for char in Array(word) {
//            if let next = cur.children[char] {
//                cur = next
//            } else {
//                return false
//            }
//        }
//
//       return cur.w.contains(word)
//    }
//
//    func startsWith(_ prefix: String) -> Bool {
//        var cur = self
//        for char in Array(prefix) {
//            if let next = cur.children[char] {
//                cur = next
//            } else {
//                return false
//            }
//        }
//
//        return true
//    }
//}

// faster utf8
//class Trie {
//    var children = [String.UTF8View.Element: Trie]()
//    var w = Set<String>()
//    init() {}
//
//    func insert(_ word: String) {
//        var cur = self
//        for char in Array(word.utf8) {
//            if cur.children[char] == nil {
//                cur.children[char] = Trie()
//            }
//
//            cur = cur.children[char]!
//        }
//
//        cur.w.insert(word)
//    }
//
//    func search(_ word: String) -> Bool {
//        var cur = self
//        for char in Array(word.utf8) {
//            if let next = cur.children[char] {
//                cur = next
//            } else {
//                return false
//            }
//        }
//
//       return cur.w.contains(word)
//    }
//
//    func startsWith(_ prefix: String) -> Bool {
//        var cur = self
//        for char in Array(prefix.utf8) {
//            if let next = cur.children[char] {
//                cur = next
//            } else {
//                return false
//            }
//        }
//
//        return true
//    }
//}

//class Trie {
//    var pr = Set<String>()
//    var w = Set<String>()
//    init() {}
//
//    func insert(_ word: String) {
//        w.insert(word)
//        var prim = ""
//        for char in Array(word) {
//            prim += String(char)
//            pr.insert(prim)
//        }
//    }
//
//    func search(_ word: String) -> Bool {
//       w.contains(word)
//    }
//
//    func startsWith(_ prefix: String) -> Bool {
//        pr.contains(prefix)
//    }
//}

class Trie {
    var children = [String.UTF8View.Element: Trie]()
    var w = Set<String>()
    init() {}

    func insert(_ word: String) {
        w.insert(word)
        var cur = self
        for char in Array(word.utf8) {
            if cur.children[char] == nil {
                cur.children[char] = Trie()
            }

            cur = cur.children[char]!
        }
    }

    func search(_ word: String) -> Bool {
       w.contains(word)
    }

    func startsWith(_ prefix: String) -> Bool {
        var cur = self
        for char in Array(prefix.utf8) {
            if let next = cur.children[char] {
                cur = next
            } else {
                return false
            }
        }

        return true
    }
}



//let tr = Trie()
//tr.insert("apple")
//print(tr.search("apple"))
//print(tr.search("app"))
