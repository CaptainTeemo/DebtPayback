
public struct MaxHeap<T: Hashable>: Heap where T: Comparable {
    public typealias Element = T
    
    public private(set) var count: Int = 0
    
    private var entity = [T]()
    
    public func getTop() -> T? {
        return entity.first
    }
    
    private mutating func maxHeapify(at index: Int) {
        let l = leftIndex(index)
        let r = rightIndex(index)
        var largest = 0
        
        if l < entity.count && entity[l] > entity[index] {
            largest = l
        } else {
            largest = index
        }
        
        if r < entity.count && entity[r] > entity[largest] {
            largest = r
        }
        
        if largest != index {
            entity.exchange(left: index, right: largest)
            maxHeapify(at: largest)
        }
    }
    
    public mutating func insert(value: T) {
        let index = entity.count - 1
        entity.insert(value, at: index)
        maxHeapify(at: index)
    }
    
    public mutating func delete(at index: Int) {
        entity.remove(at: index)
    }
    
    func debugPrint() {
        print(entity)
    }
}
