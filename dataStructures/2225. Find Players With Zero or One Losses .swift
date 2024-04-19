func findWinners(_ matches: [[Int]]) -> [[Int]] {
    var winners = [Int]()
    var oneLosers = [Int]()

    var storage = [Int: Int]()

    for match in matches {
        storage[match[0]] = storage[match[0], default: 1]
        storage[match[1], default: 1] -= 1
    }

    for key in storage.keys.sorted() {
        guard let item = storage[key] else {
            continue
        }

        if item == 0 {
            oneLosers.append(key)
            continue
        } else if item > 0 {
            winners.append(key)
        }
    }

    return [winners, oneLosers]
}
//
//let result = findWinners([[2,3],[1,3],[5,4],[6,4]])
//print(result)

