func isValid(_ s: String) -> Bool {
    if s.count % 2 != 0 {
        return false
    }

    var stack = [Character]()
    for item in s {
        if stack.isEmpty {
            stack.append(item)
            continue
        }

        let prevElem = stack[stack.count - 1]

        if (prevElem == "{" && item == "}") ||
            (prevElem == "[" && item == "]") ||
            (prevElem == "(" && item == ")") {
            stack.removeLast()
            continue
        } else {
            stack.append(item)
        }
    }


    return stack.isEmpty
}

//
//print(isValid("[}"))
