//func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
//    if k == 0 {
//        return nums
//    }
//
//    var count = nums.count
//    var result = [Int]()
//
//    for (index, _) in nums.enumerated() {
//        let leftIndex = index - k
//        let rightIndex = index + k
//        if leftIndex < 0 || rightIndex >= count {
//            result.append(-1)
//            continue
//        }
//
//        let newArr = nums[leftIndex...rightIndex]
//
//        result.append(
//            newArr.reduce(0, +) / newArr.count
//        )
//    }
//
//
//    return result
//}


// префиксный способ суммы подмассивы
func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
    if k == 0 {
        return nums
    }

    var prefixedSum = [Int]()
    for (index, current) in nums.enumerated() {
        if index == 0  {
            prefixedSum.append(current)
            continue
        }

        prefixedSum.append(current + prefixedSum[index - 1])
    }

    let count = nums.count
    var result = [Int]()

    let subArrayCount = (k * 2) + 1

    for (index, _) in nums.enumerated() {
        let leftIndex = index - k
        let rightIndex = index + k
        if leftIndex < 0 || rightIndex >= count {
            result.append(-1)
            continue
        }



        if leftIndex == 0 {
            let avrg = prefixedSum[rightIndex] / subArrayCount
            result.append(avrg)
            continue
        }

        let avrg = ((prefixedSum[rightIndex]) - prefixedSum[leftIndex - 1]) / subArrayCount

        result.append(avrg)
    }


    return result
}


//getAverages([40527,53696,10730,66491,62141,83909,78635,18560], 2)


