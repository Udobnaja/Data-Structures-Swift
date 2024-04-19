import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var storage = [Character: Int]()
    var maxi = 0
    var curStrike = 0

    for (index, char) in Array(s).enumerated() {
        if let prevIndex = storage[char] {
            if index - prevIndex < curStrike  {
                curStrike = index - prevIndex
            } else if index - prevIndex > curStrike {
                curStrike += 1
            }
        } else {
            curStrike += 1
        }

        maxi = max(maxi, curStrike)

        storage[char] = index
    }

    return maxi
}



// let result = lengthOfLongestSubstring("pwwkew") // 1121

// "tmmzuxt" // 5

// "pwwkew" // 3

// "dvdf" // 3

// "abcabcbb" // 3

// "ckilbkd" // 5

// "qrsvbspk" // 5

//print("Result: ", result)

//

////////    0, 2
///
///
///max = 1
///cur =  0
//0: d = 1 // max length 1
//1: v = 2 // max length 2
//    i = 3

//maxLength = 2

// встретил d = cur - tek [d]


//index - cur = 0


//            if index - prevIndex == 1 {
//                curStrike = 1
//            } else
