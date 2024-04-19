//
//  901. Online Stock Span.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.02.2024.
//

import Foundation


class StockSpanner {
    var u = [(price: Int, count: Int)]()

    init() {

    }

    func next(_ price: Int) -> Int {
        var count = 1

        while !u.isEmpty, u[u.count - 1].price <= price {
            count += u.removeLast().count
        }

        u.append((price: price, count: count))
        return count
    }
}

let stockSpanner = StockSpanner();
//print(stockSpanner.next(100)) // return 1
//print(stockSpanner.next(80));  // return 1
//print(stockSpanner.next(60));  // return 1
//print(stockSpanner.next(70));  // return 2
//print(stockSpanner.next(60));  // return 1
//print(stockSpanner.next(75));  // return 4, because the last 4 prices (including today's price of 75) were less than or equal to today's price.
//print(stockSpanner.next(85));  // return 6
