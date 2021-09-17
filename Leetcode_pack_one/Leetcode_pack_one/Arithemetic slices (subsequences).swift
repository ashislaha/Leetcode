//
//  Arithemetic slices (subsequences).swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 10/09/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class ArithmeticSlices {
	
	class func test() {
		let t = ArithmeticSlices()
		//let input = [2,4,6,8,10]
		let input = [7,7,7,7,7]
		let r = t.numberOfArithmeticSlices(input)
		print(r)
	}
	
	func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
		
		guard nums.count >= 3 else { return 0 }
		
		let N = nums.count
		
		// save item : [Indices] consider duplicate entires (ignore first 2 indices)
		var dict: [Int: [Int]] = [:]
		
		for i in 2...N-1 {
			if let value = dict[nums[i]] {
				dict[nums[i]] = [i] + value
				
			} else {
				dict[nums[i]] = [i]
			}
		}
		
		// iterate through each index and compute
		var results = 0
		
		for i in 0...N-3 {
			
			for j in i+1...N-2 {
				
				
				var current = i
				var next = j
				
				if (nums[j] + (nums[j] - nums[i])) > nums[N-1] {
					// do not process as it will not lead to any solution
					break
				}
				
				repeat {
					
					let currentElement = nums[current]
					let nextElement = nums[next]
					let diff = nextElement - currentElement
					let nextNextElement = nextElement + diff
					
					// going outside of the AP series
					if nextNextElement > nums[N-1] {
						break
					}
					
					// is next value present in the array
					if let value = dict[nextNextElement] {
						// process
						results += value.count
						current = next
						next = value[0]
						
					} else {
						// next item is not present
						break
					}
					
				} while next < N-1
				
			}
			
		}
		
		return results
		
		
	}
	
	
}
