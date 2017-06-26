
public struct QuickSort<T: Comparable> {
    public static func sort<T: Comparable>(input: [T]) -> [T] {
        var s = QuickSort<T>(input: input)
        s.quickSort(left: 0, right: input.count - 1)
        return s.input
    }
    
    private var input: [T]
    private init(input: [T]) {
        self.input = input
    }
    
    private mutating func quickSort(left: Int, right: Int) {
        if left >= right { return }
        let pivot = partition(left: left, right: right)
        quickSort(left: left, right: pivot - 1)
        quickSort(left: pivot + 1, right: right)
    }
    
    private mutating func partition(left: Int, right: Int) -> Int {
        var i = left
        let pivot = input[right]
        
        for j in left..<right {
            if input[j] <= pivot {
                i += 1
                input.exchange(left: i - 1, right: j)
            }
        }
        input.exchange(left: i, right: right)
        return i
    }
}
