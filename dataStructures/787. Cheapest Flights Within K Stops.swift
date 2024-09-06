//
//  787. Cheapest Flights Within K Stops.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 30.8.2024.
//

import Foundation

// Time Limit Exceeded
//func findCheapestPrice(
//    _ n: Int,
//    _ flights: [[Int]],
//    _ src: Int,
//    _ dst: Int,
//    _ k: Int
//) -> Int {
//    struct Pair: Comparable {
//        static func < (lhs: Pair, rhs: Pair) -> Bool {
//            lhs.price < rhs.price
//        }
//        let node: Int
//        let price: Int
//        let stop: Int
//    }
//    var graph = [Int: [(to: Int, price: Int)]]()
//    for flight in flights {
//        graph[flight[0], default: [(to: Int, price: Int)]()].append(
//            (to: flight[1], price: flight[2])
//        )
//    }
//
//    var disct = Array(repeating: Int.max, count: n)
//    disct[src] = 0
//    var heap = MaxHeap<Pair>()
//    heap.insert(Pair(node: src, price: 0, stop: 0))
//
//    while !heap.isEmpty {
//        let cur = heap.remove()!
//        let curNode = cur.node
//        let curPrice = cur.price
//        let curStop = cur.stop
//
//        if graph[curNode] == nil || curStop > k {
//            continue
//        }
//
//        for edge in graph[curNode]! {
//
//            let flightTo = edge.to
//            let flightPrice = edge.price
//            let stopPrice = (curPrice * -1) + flightPrice
//
//            disct[flightTo] =  min(disct[flightTo], stopPrice) //: stopPrice
//
//            if flightTo == dst {
//                continue
//             }
//
//            heap.insert(Pair(
//                node: flightTo,
//                price: stopPrice * -1,
//                stop: curStop + 1
//            ))
//        }
//    }
//
//    return disct[dst] == Int.max ? -1 : disct[dst]
//}

// slow
//func findCheapestPrice(
//    _ n: Int,
//    _ flights: [[Int]],
//    _ src: Int,
//    _ dst: Int,
//    _ k: Int
//) -> Int {
//    struct Pair: Comparable {
//        static func < (lhs: Pair, rhs: Pair) -> Bool {
//            if lhs.price == rhs.price {
//                return lhs.stop < rhs.stop
//            } else {
//                return lhs.price < rhs.price
//            }
//        }
//        let node: Int
//        let price: Int
//        let stop: Int
//    }
//    var graph = [Int: [(to: Int, price: Int)]]()
//    for flight in flights {
//        graph[flight[0], default: [(to: Int, price: Int)]()].append(
//            (to: flight[1], price: flight[2])
//        )
//    }
//
//    var disct = Array(repeating: Int.max, count: n)
//    disct[src] = 0
//    let heap = MaxHeap<Pair>()
//    heap.insert(Pair(node: src, price: 0, stop: 0))
//
//    while !heap.isEmpty {
//        let cur = heap.remove()!
//        let curNode = cur.node
//        let curPrice = cur.price
//        let curStop = cur.stop
//
//        if graph[curNode] == nil || curPrice > disct[curNode] {
//            continue
//        }
//
//        for edge in graph[curNode]! {
//
//            let flightTo = edge.to
//            let flightPrice = edge.price
//            let stopPrice = curPrice + flightPrice
//
//            disct[flightTo] =  min(disct[flightTo], stopPrice) //: stopPrice
//
//            if flightTo == dst || curStop + 1 > k {
//                continue
//            }
//
//            heap.insert(Pair(
//                node: flightTo,
//                price: stopPrice,
//                stop: curStop + 1
//            ))
//        }
//    }
//
//    return disct[dst] == Int.max ? -1 : disct[dst]
//}


func findCheapestPrice(
    _ n: Int,
    _ flights: [[Int]],
    _ src: Int,
    _ dst: Int,
    _ k: Int
) -> Int {
    struct Pair {
        let node: Int
        let price: Int
    }
    var graph = [Int: [(to: Int, price: Int)]]()
    for flight in flights {
        graph[flight[0], default: [(to: Int, price: Int)]()].append(
            (to: flight[1], price: flight[2])
        )
    }
    
    var disct = Array(repeating: Int.max, count: n)
    disct[src] = 0
    var q = [Pair(node: src, price: 0)]
    var stops = -1
    while !q.isEmpty && stops < k {
        for _ in 0..<q.count {
            let cur = q.removeFirst()
            let curNode = cur.node
            let curPrice = cur.price
            
            if graph[curNode] == nil {
                continue
            }
            
            for edge in graph[curNode]! {
                let flightTo = edge.to
                let flightPrice = edge.price
                let stopPrice = curPrice + flightPrice
                
                guard stopPrice < disct[flightTo] else {
                    continue
                }
                
                disct[flightTo] =  min(disct[flightTo], stopPrice) //: stopPrice
                
                if flightTo == dst {
                    continue
                }
                    
                q.append(Pair(
                    node: flightTo,
                    price: stopPrice
                ))
            }
        }
        
        
        stops += 1
    }
    
    return disct[dst] == Int.max ? -1 : disct[dst]
}
//print(findCheapestPrice(4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1))
//print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0))
//print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1))

//print(findCheapestPrice(5, [[0,1,5],[1,2,5],[0,3,2],[3,1,2],[1,4,1],[4,2,1]], 0, 2, 2)) // 7


//print(findCheapestPrice(4, [[0,1,1],[0,2,5],[1,2,1],[2,3,1]], 0, 3, 1))


