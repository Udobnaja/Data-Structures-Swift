func findMaxLength(_ nums: [Int]) -> Int {
    var storage = [0: -1]
    var result = 0
    var count = 0

    for (index, num) in nums.enumerated() {
        count = count + (num == 1 ? 1 : -1)
        if let sameCount = storage[count] {
            result = max(result, index - sameCount)
        } else {
            storage[count] = index
        }
    }

    return result
}

//let result = findMaxLength([0,1, 1, 0])
//
//print("Result: ", result)
