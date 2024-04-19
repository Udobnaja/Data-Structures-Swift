func largestUniqueNumber(_ nums: [Int]) -> Int {
    var storage = [Int: Int]()

    for num in nums {
        storage[num] = (storage[num] ?? 0) + 1
    }

    var max = 0
    var hasMax = false
    for item in storage {
        if item.value == 1 && max < item.key {
            max = item.key
            hasMax = true
        }
    }

    return hasMax ? max : -1
}

//let result = largestUniqueNumber([9,9,8,8])
//
//print("Result: ", result)

