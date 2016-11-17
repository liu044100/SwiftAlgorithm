import UIKit

public func solution(A: [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    
    var K1 = Array(repeating: 0, count: A.count)
    var K2 = Array(repeating: 0, count: A.count)
    
    let count = A.count
    
    for i in 1..<count {
        K1[i] = Swift.max(K1[i - 1] + A[i], 0)
    }
    
    for i in (0..<count-1).reversed() {
        K2[i] = Swift.max(K2[i+1]+A[i], 0)
    }
    
    var max = 0
    
    for i in 1..<count-1 {
        max = Swift.max(max, K1[i-1]+K2[i+1])
    }
    
    return max
}

let A = [3, 2, 6, -1, 4, 5, -1, 2]
let a = solution(A: A)
a
