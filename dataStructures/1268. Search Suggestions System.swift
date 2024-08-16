//
//  1268. Search Suggestions System.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 16.8.2024.
//

import Foundation


func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
    
    class Trie {
        var children = [String.UTF8View.Element: Trie]()
        var data = [String]()
    }
    
    let root = Trie()
    for product in products { // can sort hear // can use hasPrefix
        let pr = Array(product.utf8)
        var cur = root
        
        for char in pr {
            if cur.children[char] == nil {
                cur.children[char] = Trie()
            }
            
            cur = cur.children[char]!
            cur.data.append(product)
            cur.data.sort()
            if cur.data.count > 3 {
                cur.data.removeLast()
            }
        }
    }
    
    var answ = [[String]]()
    var node = root
    for s in Array(searchWord.utf8) {
        if let next = node.children[s] {
            answ.append(next.data)
            node = next
        } else {
            answ.append([])
            node = Trie()
        }
    }
    
    return answ
}

//print(suggestedProducts(["mobile","mouse","moneypot","monitor","mousepad"], "mouse"
//))

// print(suggestedProducts(["havana"], "havana"))


//[
//    ["mobile","moneypot","monitor"],
//    ["mobile","moneypot","monitor"],
//    ["mouse","mousepad"],
//    ["mouse","mousepad"],
//    ["mouse","mousepad"]
//]
