//
//  AlmostBinarySearch.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 31/01/22.
//  Copyright © 2022 Ashis Laha. All rights reserved.
//

import Foundation

class AlmostSortedArray {
	
	func solve(_ A: inout [Int], _ B: inout Int) -> Int {
			guard !A.isEmpty else { return -1 }
			
			var low = 0
			var high = A.count-1
			return binarySearch(&A, &B, &low, &high)
			
		}
		
		// return index of the key element in the array
		func binarySearch(_ A: inout [Int], _ key: inout Int, _ low: inout Int, _ high: inout Int) -> Int {
			
			guard low <= high else { return -1 }
			
			let mid = (low + high) / 2
			
			// base case
			if A[mid] == key {
				return mid
			} else if (low < mid && A[mid-1] == key) {
				return mid - 1
			} else if (high > mid && A[mid+1] == key) {
				return mid + 1
			}
			
			if key < A[mid] {
				// key belongs to the left hand side
				high = mid - 1
			} else {
				low = mid + 1
			}
			
			return  binarySearch(&A, &key, &low, &high)
		}
	
	class func test() {
		let obj = AlmostSortedArray()
		var input = [8,1,18,14]
		var key = 18
		let output = obj.solve(&input, &key)
		print(output)
	}
}
