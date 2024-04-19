//
//  346. Moving Average from Data Stream.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 11.02.2024.
//

import Foundation

class MovingAverage {
    let max: Int
    var q = [Int]()
    init(_ size: Int) {
        self.max = size
    }

    func next(_ val: Int) -> Double {
        q.append(val)

        if q.count > max {
            q.removeFirst()
        }

        return Double(q.reduce(0, +)) / Double(q.count)
    }

//    let max: Int
//        var indx = 0
//        var q = [Int]()
//        init(_ size: Int) {
//            self.max = size
//        }
//
//        func next(_ val: Int) -> Double {
//            q.append(val)
//
//            if q.count > max {
//                indx += 1
//            }
//
//            var counter = indx
//            var sum: Double = 0
//            while counter < q.count {
//                sum += Double(q[counter])
//                counter += 1
//            }
//
//            return sum / Double(q.count - indx)
//        }
}

//let movingAverage = MovingAverage(4)
//
//print(movingAverage.next(100)) // return 5.5 = (1 + 10) / 2
//print(movingAverage.next(-10)) // return 4.66667 = (1 + 10 + 3) / 3
//print(movingAverage.next(-300))
//print(movingAverage.next(50))
//print(movingAverage.next(0))

//[null,100.00000,45.00000,-70.00000,-40.00000,-65.00000]
