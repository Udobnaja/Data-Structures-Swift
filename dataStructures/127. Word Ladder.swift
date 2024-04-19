//
//  127. Word Ladder.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 06.04.2024.
//

import Foundation

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    var wordList = Set(wordList.map { Array($0) })
        let endWord = Array(endWord)
        guard wordList.contains(endWord) else { return 0 }

        var uniqL = Set<Character>()
        for word in wordList {
            for letter in word {
                uniqL.insert(letter)
            }
        }

        let beginWord = Array(beginWord)

        wordList.remove(beginWord)

        var q = [beginWord]
        var steps = 0
        while !q.isEmpty {
            var newQ =  [[Character]]()
            let l = q.count

            for i in 0..<l {
                let word = q[i]

                if word == endWord {
                    return steps + 1
                }

                for j in 0..<word.count {
                    var copied = word
                    for letter in uniqL {
                        copied[j] = letter
                        if wordList.contains(copied) {
                            wordList.remove(copied)
                            newQ.append(copied)
                        }
                    }
                }
            }

            q = newQ
            steps += 1
        }

        return 0
   }

//print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))



