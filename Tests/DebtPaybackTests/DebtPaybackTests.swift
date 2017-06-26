import XCTest
@testable import ADT
@testable import Algorithms

class DebtPaybackTests: XCTestCase {
    func testDoublyLinkedList() {
        var list = DoublyLinkedList<Int>()
        for i in 0..<10 {
            let node = ListNode<Int>(value: i)
            list.append(node: node)
        }
        
        let node = ListNode<Int>(value: 5)
        list.insert(at: 5, node: node)
        
        list.debugPrint()
        
        XCTAssert(true)
    }
    
    func testStack() {
        
        XCTAssert(true)
    }
    
    func testBinarySearchTree() {
        var bst = BinarySearchTree<Int, Int>()
        for i in 0..<10 {
            bst.setValue(for: i, value: i)
        }
        bst.debugPrint()
        print(bst.getKeys())
        print(bst.getValues())
        XCTAssert(true)
    }
    
    func testMergeSort() {
        let input = [2, 5, 8, 1, 9, 7, 4, 3, 6, 100, 0]
        print(MergeSort.sort(input: input))
        
        XCTAssert(true)
    }
    
    func testQuickSort() {
        let input = [2, 5, 8, 1, 9, 7, 4, 3, 6, 100, 0]
        print(QuickSort<Int>.sort(input: input))
        
        XCTAssert(true)
    }
    
    func testHeap() {
        let input = [2, 5, 8, 1, 9, 7, 4, 3, 6, 100, 0]
        var heap = MaxHeap<Int>()
        for i in 0..<input.count {
            heap.insert(value: i, at: i)
        }
        
        heap.debugPrint()
        
        heap.delete(at: 3)
        
        heap.debugPrint()
        
        XCTAssert(true)
    }

    static var allTests = [
        ("testDoublyLinkedList", testDoublyLinkedList),
        ("testStack", testStack),
        ("testBinarySearchTree", testBinarySearchTree),
        ("testMergeSort", testMergeSort),
    ]
}
