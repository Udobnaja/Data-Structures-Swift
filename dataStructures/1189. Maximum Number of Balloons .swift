func maxNumberOfBalloons(_ text: String) -> Int {
    let text = Array(text)
    var storage = [Character: Double]()
    storage["b"] = 0
    storage["a"] = 0
    storage["l"] = 0
    storage["o"] = 0
    storage["n"] = 0

    for char in text {
        if storage[char] != nil {
            let increment = char == "l" || char == "o" ? 0.5 : 1
            storage[char]! += increment
        }
    }

    return Int(storage.values.sorted()[0])
}
//
//let result = maxNumberOfBalloons("leetcode")
//print("Result: ", result)
