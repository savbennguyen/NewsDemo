func checkPalindrome(for input: String) {
    if (input.lowercased() == revert(text: input).lowercased()) {
        print("\(input) is a palindrome")
        return
    }
    print("\(input) isn’t a palindrome")
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func revert(text input: String) -> String {
    var revertedText: String = ""
    for index in stride(from: input.count - 1, through: 0, by: -1) {
        revertedText.append(input[index])
    }
    return revertedText
}

checkPalindrome(for: "aka")
checkPalindrome(for: "Level")
checkPalindrome(for: "Hello")