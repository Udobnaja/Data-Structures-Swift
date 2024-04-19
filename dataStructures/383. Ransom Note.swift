import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var magazinStorage = [Character: Int]()

    for char in Array(magazine) {
        magazinStorage[char, default: 0] += 1
    }

    var answer = true

    for char in Array(ransomNote) {
        guard let count = magazinStorage[char], count - 1 >= 0 else {
            answer = false
            break
        }

        magazinStorage[char] = count - 1
    }

    return answer
}

//let result = canConstruct("aa", "aab")
//
//print("Result: ", result)
