//
//  433. Minimum Genetic Mutation.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 30.03.2024.
//

import Foundation

func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
    let bank = Set(bank.map { Array($0) })
    let startGene = Array(startGene)
    let endGene = Array(endGene)
    let validMut: [String.Element] = ["A", "C", "G", "T"]

    var q = [startGene]
    var steps = 0
    var seen = Set([startGene])
    while !q.isEmpty {
        var newQ = [[String.Element]]()
        let qL = q.count

        for i in 0..<qL {
            let gen = q[i]

            if gen == endGene {
                 return steps
            }

            for j in 0..<gen.count {
                for replace in 0..<validMut.count {
                    var copiedGen = gen
                    copiedGen[j] = validMut[replace]
                    guard !seen.contains(copiedGen) else { continue }
                    seen.insert(copiedGen)
                    if bank.contains(copiedGen) {
                        newQ.append(copiedGen)
                    }
                }
            }
        }

        q = newQ
        steps += 1
    }

    return -1
}

//print(minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"]))

