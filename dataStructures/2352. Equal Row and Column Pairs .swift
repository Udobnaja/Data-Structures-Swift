func equalPairs(_ grid: [[Int]]) -> Int {
    var storage = [String: Int]()

    for row in grid {
        let key = row.map{"\($0)"}.joined(separator: ",")
        storage[key, default: -1] += 1
    }

    var pair = 0

    for index in 0..<grid.count {
        var column = [Int]()
        for j in 0..<grid.count {
            column.append(grid[j][index])
        }

        let key = column.map{"\($0)"}.joined(separator: ",")
        if let value = storage[key] {
            pair += (value + 1)
        }
    }

    return pair
}

//let result = equalPairs([[11,1],[1,11]])
//
//print("Result: ", result)
