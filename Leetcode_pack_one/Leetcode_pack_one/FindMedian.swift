//
//  FindMedian.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 11/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


/// it gives us the middle element of the sorted array
/// if the number of the elements are odd, it returns the middle of it. else it will return (arr.count/2) and (arr.count/2)-1 elements.
class FindMedian {
	
	/// minHeap contains those elements having more value than current median
	let minHeap = BinaryMinHeap([])
	
	/// MaxHeap contains those elements having less value than current median
	let maxHeap = BinaryMaxHeap([])

	var currentMedian: Double = 0.0
	
	
	/** initialize your data structure here. */
	init() {
		
	}
	
	func addNum(_ num: Int) {
		
		// We are maintaining a min heap of right hand side of the median element
		// and a maxHeap of left hand side of the median element. Do comparision with top of the heap.
		
		if minHeap.arr.isEmpty && maxHeap.arr.isEmpty {
			minHeap.insert(value: num)
			currentMedian = Double(num)
			return
		}
		
		// if both minHeap and maxHeap has same number then add e based on its value with current Median
		if minHeap.arr.count == maxHeap.arr.count {
			// check num with current median
			
			if Double(num) < currentMedian {
				// should go to MaxHeap
				maxHeap.insert(value: num)
			} else {
				// should go to MinHeap
				minHeap.insert(value: num)
			}
			
			updateMedian()
			
		} else {
			
			if minHeap.arr.count > maxHeap.arr.count {
				// min heap has more element
				
				if Double(num) < currentMedian {
					maxHeap.insert(value: num)
				} else {
					if let topMin = minHeap.extractMin() {
						maxHeap.insert(value: topMin)
						minHeap.insert(value: num)
					}
				}
				updateMedian()
				
				
			} else { // max heap has more element
				
				if Double(num) > currentMedian {
					// it can move to min Heap
					minHeap.insert(value: num)
				} else {
					// it can move to max heap
					if let max = maxHeap.extractMax() {
						minHeap.insert(value: max)
						maxHeap.insert(value: num)
					}
				}
				
				updateMedian()
			}
			
		}
	}
	
	func updateMedian() {
		let min = minHeap.getMin() ?? 0
		let max = maxHeap.getMax() ?? 0
		
		if minHeap.heapSize == maxHeap.heapSize {
			currentMedian = Double(min + max) / 2.0
		} else {
			if minHeap.heapSize > maxHeap.heapSize {
				currentMedian = Double(min)
			} else {
				currentMedian = Double(max)
			}
		}
	}
	
	func median() -> Double {
		return currentMedian
	}
	
	
	static func test() {
		let findMedian = FindMedian()
		let input1 = [6, 10, 2, 6, 5, 0, 6, 3, 1, 0, 0] // Median = 3.0
		let input2 = [5, 15, 1, 3] // Median = 4.0
		let input3 = [1, 2, 3] // Median = 2.0
		let input4 = [1, 2, 3, 4, 5, 6, 7] // median = 4.0
		
		for each in input4 {
			findMedian.addNum(each)
			print("Median --> ", findMedian.median())
			print("maxHeap -->", findMedian.maxHeap.arr)
			print("minHeap -->", findMedian.minHeap.arr)
		}
		print(findMedian.median())
		
	}
	
}

class BinaryMinHeap {
	
	var arr: [Int] = []
	var heapSize: Int
	
	func left(_ index: Int) -> Int  { return index * 2 + 1 }
	func right(_ index: Int) -> Int { return index * 2 + 2 }
	func parent( _ index: Int) -> Int { return (index - 1) / 2 }
	
	init(_ items: [Int]) {
		arr = items
		heapSize = arr.count
		
		if arr.count > 0 {
			createHeap()
		}
	}
	
	func heapify(_ index: Int) {
		
		let leftIndex = left(index)
		let rightIndex = right(index)
		var minIndex = index
		
		if leftIndex < heapSize && arr[leftIndex] < arr[index] {
			minIndex = leftIndex
		}
		
		if rightIndex < heapSize && arr[rightIndex] < arr[minIndex] {
			minIndex = rightIndex
		}
		
		if minIndex != index {
			arr.swapAt(minIndex, index)
			heapify(minIndex)
		}
	}
	
	func createHeap() {
		var i = (heapSize-1) / 2
		while i >= 0 {
			heapify(i)
			i -= 1
		}
	}
	
	func insert(value: Int) {
		
		// insert into the end of the heap
		arr.append(value)
		heapSize = arr.count
		
		var index = heapSize - 1
		while index > 0 {
			let parentIndex = parent(index)
			if parentIndex >= 0 && arr[parentIndex] > arr[index] {
				// parent is bigger than child, breaking heap property
				arr.swapAt(parentIndex, index)
				index = parentIndex
			} else {
				// heap property is maintained
				break
			}
		}
	}
	
	func getMin() -> Int? {
		return arr.first
	}
	
	func extractMin() -> Int? {
		guard !arr.isEmpty else { return nil }
		
		let first = arr.first
		arr[0] = arr[heapSize - 1]
		heapSize -= 1
		arr.removeLast() // we can remove the last element as it is not useful.
		heapify(0)
		
		return first
	}
}


class BinaryMaxHeap {
	
	var arr: [Int] = []
	var heapSize: Int
	
	func left(_ index: Int) -> Int  { return index * 2 + 1 }
	func right(_ index: Int) -> Int { return index * 2 + 2 }
	func parent( _ index: Int) -> Int { return (index - 1) / 2 }
	
	init(_ items: [Int]) {
		arr = items
		heapSize = arr.count
		
		if arr.count > 0 {
			createHeap()
		}
	}
	
	func heapify(_ index: Int) {
		
		let leftIndex = left(index)
		let rightIndex = right(index)
		var maxIndex = index
		
		if leftIndex < heapSize && arr[leftIndex] > arr[index] {
			maxIndex = leftIndex
		}
		
		if rightIndex < heapSize && arr[rightIndex] > arr[maxIndex] {
			maxIndex = rightIndex
		}
		
		if maxIndex != index {
			arr.swapAt(maxIndex, index)
			heapify(maxIndex)
		}
	}
	
	func createHeap() {
		var i = (heapSize-1) / 2
		while i >= 0 {
			heapify(i)
			i -= 1
		}
	}
	
	func insert(value: Int) {
		
		// insert into the end of the heap
		arr.append(value)
		heapSize = arr.count
		
		var index = heapSize - 1
		while index > 0 {
			let parentIndex = parent(index)
			if parentIndex >= 0 && arr[parentIndex] < arr[index] {
				// parent is bigger than child, breaking heap property
				arr.swapAt(parentIndex, index)
				index = parentIndex
			} else {
				// heap property is maintained
				break
			}
		}
	}
	
	func getMax() -> Int? {
		return arr.first
	}
	
	func extractMax() -> Int? {
		guard !arr.isEmpty else { return nil }
		
		let first = arr.first

		arr[0] = arr[heapSize - 1]
		heapSize -= 1
		arr.removeLast() // remove the unused element
		heapify(0)
		
		return first
	}
}


