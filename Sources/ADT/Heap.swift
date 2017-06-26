
public protocol Heap {
    associatedtype Element: Hashable
    
    var count: Int { get }
    
    func getTop() -> Element?
    
    func parentIndex(_ index: Int) -> Int
    func leftIndex(_ index: Int) -> Int
    func rightIndex(_ index: Int) -> Int
    
    mutating func insert(value: Element)
    mutating func delete(at index: Int)
}

extension Heap {
    public func parentIndex(_ index: Int) -> Int {
        return index / 2
    }
    
    public func leftIndex(_ index: Int) -> Int {
        return index * 2
    }
    
    public func rightIndex(_ index: Int) -> Int {
        return index * 2 + 1
    }
}
