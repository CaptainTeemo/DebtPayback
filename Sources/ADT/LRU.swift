
public struct LRU<KeyType: Hashable, ValueType: Hashable> where ValueType: Comparable {
    private var list: DoublyLinkedList<ValueType> = DoublyLinkedList<ValueType>()
    private var data: [KeyType: ListNode<ValueType>] = [:]
    
    private var capacity: Int = 0
    
    public init(capacity: Int) {
        self.capacity = capacity
    }
    
    public mutating func get(by key: KeyType) -> ValueType? {
        if let node = data[key] {
            moveToHead(node: node)
            return node.value
        }
        return nil
    }
    
    public mutating func set(value: ValueType, for key: KeyType) {
        let newNode = ListNode<ValueType>(value: value)
        if let node = data[key] {
            moveToHead(node: node)
        } else {
            list.insert(at: 0, node: newNode)
        }
        data[key] = newNode
        
        if list.count >= capacity {
            list.removeLast()
        }
    }
    
    private mutating func moveToHead(node: ListNode<ValueType>) {
        let prev = node.prev
        let next = node.next
        
        prev?.next = next
        next?.prev = prev
        
        list.insert(at: 0, node: node)
    }
}
