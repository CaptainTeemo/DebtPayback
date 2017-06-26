
public struct PriorityQueue<T: Comparable>: QueueType where T: Hashable {
    public typealias Element = T

    private var heap: MaxHeap<Int> = MaxHeap<Int>()
    private var priorities: [Int: [T]] = [:]
    
    public mutating func enqueue(value: T, priority: Int) {
        if var values = priorities[priority] {
            values.append(value)
            priorities[priority] = values
        } else {
            priorities[priority] = [value]
        }
        heap.insert(value: priority)
    }
    
    public func dequeue() -> T? {
        if let p = heap.getTop(), let v = priorities[p] {
            return v.first
        }
        return nil
    }
}
