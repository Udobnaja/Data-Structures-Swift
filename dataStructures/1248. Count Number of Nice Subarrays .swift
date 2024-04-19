func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var answ = 0
    var prefixedOdd = [0: 1]
    var curr = 0

    for num in nums {
        if num % 2 != 0 {
            curr += 1
        }

        answ += prefixedOdd[curr - k] ?? 0

        prefixedOdd[curr] = (prefixedOdd[curr] ?? 0) + 1
    }

    return answ
}

//let result = numberOfSubarrays([2,2,2,7,2,2,7,2,7], 2)
//
//print("Result: ", result)
