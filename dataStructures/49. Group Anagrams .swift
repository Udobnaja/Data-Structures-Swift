func groupAnagrams(_ strs: [String]) -> [[String]] {
    var storage = [String: [String]]()

    for str in strs {
        let key = String(str.sorted())
        storage[key, default: []].append(str)
    }

    return Array(storage.values)
}

//let result = groupAnagrams(["eat","tea","tan","ate","nat","bat", "eate"])
//
//print("Result: ", result)
