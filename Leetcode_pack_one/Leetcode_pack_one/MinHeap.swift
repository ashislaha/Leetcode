//
//  MinHeap.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 16/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

/// Min-Heap:
class HeapNode {
	let value: Int
	var next: HeapNode?
	init(value: Int) {
		self.value = value
		self.next = nil
}
}

class MinHeap {
	
	private var heapSize: Int
	private var heapArr: [HeapNode]
	
	init(array: [HeapNode]) {
		heapSize = array.count
		heapArr = array
		
		var i = (heapSize-1) / 2
		while i >= 0 {
			heapify(i)
			i -= 1
		}
	}
	
	func heapify(_ index: Int) {
		
		let left = getLeft(index)
		let right = getRight(index)
		var minIndex = index
		
		if left < heapSize && heapArr[left].value < heapArr[index].value {
			minIndex = left
		}
		
		if right < heapSize && heapArr[right].value < heapArr[minIndex].value {
			minIndex = right
		}
		
		if minIndex != index {
			heapArr.swapAt(minIndex, index)
			heapify(minIndex)
		}
		
	}
	
	private func getLeft(_ index: Int) -> Int { return 2 * index + 1 }
	private func getRight(_ index: Int) -> Int { return 2 * index + 2 }
	private func getParent(_ index: Int) -> Int { return (index-1) / 2 }
	
	func insert(value: Int) {
		
		// increase the heap size
		heapSize += 1
		heapArr.append(HeapNode(value: value))
		
		// maintain the heap property from bottom to root
		var i = heapSize-1
		while i > 0 {
			let parent = getParent(i)
			if value < heapArr[parent].value {
				// swap between parent and child node
				heapArr.swapAt(parent, i)
				i = parent
			} else {
				// heap property is maintained, break it
				break
			}
		}
	}
	
	
	func getMin() -> HeapNode? {
		guard !heapArr.isEmpty else { return nil }
		return heapArr[0]
	}
	
	func extractMin() -> Int {
		let value = heapArr[0].value
		heapArr.swapAt(0, heapSize-1)
		heapSize -= 1
		heapify(0)
		
		// if we want to remove the last element in heap, we can do that.
		// heapArr.removeLast()
		return value
	}
	
	func sortArray() -> [HeapNode] {
		
		while heapSize > 0 {
			heapify(0)
			heapArr.swapAt(0, heapSize-1)
			heapSize -= 1
		}
		
		return heapArr
	}
	
	
	static func heapTest() {
		
		print("Before sorting using min-heap ---> [10, 20, 15, 30, 25, 5, 9]")
		let test = [10, 20, 15, 30, 25, 5, 9]
		var input: [HeapNode] = []
		
		for each in test {
			input.append(HeapNode(value: each))
		}
		
		let heap = MinHeap(array: input)
		print("After creating the heap ----> min element ", heap.getMin()?.value ?? -1)
		
		
		
		
		let result = heap.sortArray()
		
		print("After sorting using min-heap ---> ")
		for each in result {
			print(each.value)
		}
	}
	
}
