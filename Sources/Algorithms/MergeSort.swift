
public struct MergeSort {
    public static func sort<T: Comparable>(input: [T]) -> [T] {
        return mergeSort(input: input)
    }
    
    private static func mergeSort<T: Comparable>(input: [T]) -> [T] {
        if input.count < 2 { return input }
        let mid = input.count / 2
        
        let leftSlice = input[0..<mid]
        let rightSlice = input[mid..<input.count]
        
        let left = mergeSort(input: Array<T>(leftSlice))
        let right = mergeSort(input: Array<T>(rightSlice))
        return merge(left: left, right: right)
    }
    
    private static func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
        var leftTemp = left
        var rightTemp = right
        
        var merged = [T]()
        
        while let l = leftTemp.first, let r = rightTemp.first {
            if l < r {
                merged.append(l)
                leftTemp.removeFirst()
            } else {
                merged.append(r)
                rightTemp.removeFirst()
            }
        }
        
        while let l = leftTemp.first {
            merged.append(l)
            leftTemp.removeFirst()
        }
        
        while let r = rightTemp.first {
            merged.append(r)
            rightTemp.removeFirst()
        }
        
        return merged
    }
}
