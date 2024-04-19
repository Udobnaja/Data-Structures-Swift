func simplifyPath(_ path: String) -> String {
    let splited = path.split(separator: "/")
    var stack = [Substring]()

    for part in splited {
        if part == ".." {
            stack.popLast()
        } else if part != "." {
            stack.append(part)
        }
    }

    let answer = stack.joined(separator: "/")

    return "/" + answer
}

// "/c"
//print(simplifyPath("/a/../../b/../c//.//"))

// "/a/./b/../../c/
// "/a/./b/../../c/"
// "/../"


// "/a/../../b/../c//.//"
