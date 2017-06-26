
public protocol SymbolTable {
    associatedtype Key: Comparable
    associatedtype Element: Hashable
    
    var count: Int { get }
    
    mutating func getValue(by key: Key) -> Element?
    mutating func setValue(for key: Key, value: Element)
    func getKeys() -> [Key]
    func getValues() -> [Element]
}
