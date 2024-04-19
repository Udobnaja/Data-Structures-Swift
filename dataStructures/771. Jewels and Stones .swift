import Foundation

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
    var jewelsStorage = [Character: Bool]()

    for jewel in Array(jewels) {
        jewelsStorage[jewel] = true
    }

    var count = 0

    for stone in stones {
        if jewelsStorage[stone] != nil {
            count += 1
        }
    }

    return count
}

//let result = numJewelsInStones("aA", "aAAbbbb")
//
//print("Result: ", result)
