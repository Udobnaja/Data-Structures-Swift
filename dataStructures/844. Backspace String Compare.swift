func backspaceCompare(_ s: String, _ t: String) -> Bool {
    func toStr(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            if char == "#" {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }

        return String(stack)
    }

    return toStr(s) == toStr(t)
}

//print(backspaceCompare("y#fo##f", "y#f#o##f"))
