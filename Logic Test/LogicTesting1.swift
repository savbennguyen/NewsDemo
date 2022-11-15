func middleIndex(of array: [Int]) {
    if (array.count < 3) {
        print("index not found")
    }
    
    for index in 1...array.count - 2 {
        if (sum(of: array, from: 0, to: index - 1) == sum(of: array, from: index + 1, to: array.count - 1) ) {
            print("middle index is \(index)")
            return
        }
    }
    print("index not found")
}

func sum(of array: [Int], from start: Int, to end: Int) -> Int {
    var sum: Int = 0
    for index in start...end {
        sum += array[index]
    }
    return sum
}

middleIndex(of: [1, 3, 5, 7, 9])
middleIndex(of: [3, 6, 8, 1, 5, 10, 1, 7])
middleIndex(of: [3, 5, 6])
