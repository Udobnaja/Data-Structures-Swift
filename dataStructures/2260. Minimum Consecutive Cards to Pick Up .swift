func minimumCardPickup(_ cards: [Int]) -> Int {
    var storage = [Int: Int]()
    var mini = -1
    for (index, card) in cards.enumerated() {
        if let firstTimeMetIndex = storage[card] {
            let diff = (index + 1) - firstTimeMetIndex
            if mini != -1 {
                mini = min(mini, diff)
            } else {
                mini = diff
            }
        }

        storage[card] = index
    }

    return mini
}

//let result = minimumCardPickup([1,0,5,3,3])
//
//print("Result: ", result)
