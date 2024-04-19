func makeGood(_ s: String) -> String {
    var stack = [Character]()

    for char in s {
        if stack.isEmpty {
            stack.append(char)
            continue
        }

        let prevChar = stack[stack.count - 1]

        if char.isUppercase && prevChar.isLowercase || prevChar.isUppercase && char.isLowercase {
            if prevChar.uppercased() == char.uppercased() {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        } else {
            stack.append(char)
        }
    }

    return String(stack)
}

// print(makeGood("mC"))
