import UIKit

public func solution(A : [Int]) -> Int {
    
    var sumZeroCount = 0
    var sum = 0
    var list = [Int: Int]()
    
    for i in 0..<A.count {
        sum += A[i]
        
        if let count = list[sum] {
            list[sum] = count + 1
            sumZeroCount += count
        } else {
            list[sum] = 1
        }
    }
    
    if let count = list[0] {
        sumZeroCount += count
    }
    
    return sumZeroCount
}

let A = [2, -2, 3, 0, 4, -7]
let result = solution(A: A)