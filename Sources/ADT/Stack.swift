 
public struct Stack<T: Hashable> {
    private var list: DoublyLinkedList<T> = DoublyLinkedList<T>()
    
    public mutating func push(value: T) {
        let node = ListNode<T>(value: value)
        list.append(node: node)
    }
    
    public mutating func pop() -> T? {
        return list.removeLast()?.value
    }
}
