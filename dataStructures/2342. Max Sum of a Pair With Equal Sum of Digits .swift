func maximumSum(_ nums: [Int]) -> Int {
    var storage = [Int: Int]()
    var maxi = -1
    for num in nums {
        let sum = String(num).compactMap(\.wholeNumberValue).reduce(0, +)

        if let numberWithTheSameSum = storage[sum] {
            maxi = max(maxi, numberWithTheSameSum + num)
        }
        storage[sum] = max(storage[sum, default: 0], num)
    }

    return maxi
}

//let result = maximumSum([18,43,36,13,7])
//
//print("Result: ", result)
