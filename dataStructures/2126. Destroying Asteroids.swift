//
//  2126. Destroying Asteroids.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 22.04.2024.
//

import Foundation

func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
    var mass = mass
    for asteroid in asteroids.sorted() {
        if asteroid > mass {
            return false
        }

        mass += asteroid
    }

    return true
}

//asteroidsDestroyed(10, [3,9,19,5,21])
