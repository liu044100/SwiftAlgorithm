##Question

A non-empty zero-indexed array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The sum of a slice (P, Q) is the total of A[P] + A[P+1] + ... + A[Q].

**Write a function:**

int solution(int A[], int N);
that, given an array A consisting of N integers, returns sum euqal zero of any slice of A.

For example, given array A such that:

`A = [2, -2, 3, 0, 4, -7]`

the function should return 4 because:

`(2, -2)` is a slice of A that has sum 0,

`(3, 0, 4, -7)` is a slice of A that has sum 0,

`(0)` is a slice of A that has sum 0,

`(2, -2, 3, 0, 4, -7)` is a slice of A that has sum 0.

**Assume that:**

N is an integer within the range `[1..1,000,000]`;

each element of array A is an integer within the range `[−1,000,000..1,000,000]`;

the result will be an integer within the range `[−2,147,483,648..2,147,483,647]`.

**Complexity:**

expected worst-case time complexity is `O(log N)`;
expected worst-case space complexity is `O(N)`, beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

##Answer

The key point is how to get a better time complexity. 

The `O(n^2)` solution is very simple and intuitive, using a `nested loop`, like below:

```swift
import UIKit

public func solution(A : [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var sum = 0
    var count = 0
    
    for i in (0..<A.count) {
        let newA = A[0..<i]
        
        for i in newA {
            sum += i
            if sum == 0 {
                count += 1
            }
        }
        
        sum = 0
    }

    return count
}

let A = [2, -2, 3, 0, 4, -7]
let result = solution(A: A)
```

But this test expected worst-case time complexity is `O(log N)`, so we have to think about other solution.

Check below code, we can know that `A[3]`, `A[3] + A[4]`, `A[3] + A[4] + A[5]` and `A[3] + A[4] + ... + A[N-1]` is equal zero.

```swift
A[0] + A[1] + A[2] = 5
A[0] + A[1] + A[2] + A[3] = 5
A[0] + A[1] + A[2] + A[3] + A[4] = 5
A[0] + A[1] + A[2] + A[3] + A[4] + A[5] = 5
A[0] + A[1] + A[2] + A[3] + A[4] + ... + A[N-1] = 5
```
So we can use a dictionary, the key is `sum`, the value is the `count` for the same sum.

Increment the variable `sumZeroCount` when has the same sum. 

```swift
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

```

A trap is that it is very easy to forget the case that the sum equal zero, so we should add below code after the loop.

```swift
    if let count = list[0] {
        sumZeroCount += count
    }
```

The whole answer is [here](SliceSumZero.playground).