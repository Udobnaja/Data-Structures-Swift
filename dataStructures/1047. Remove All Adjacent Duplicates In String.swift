func removeDuplicates(_ s: String) -> String {
    var stack = [Character]()

    for char in s {
        if stack.isEmpty {
            stack.append(char)
            continue
        }

        let prevChar = stack[stack.count - 1]

        if char == prevChar {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }

    return String(stack)
}

//print(removeDuplicates("abccba"))
