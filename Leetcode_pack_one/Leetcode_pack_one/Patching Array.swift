//
//  Patching Array.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 31/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class PatchinArray {
	
	static func test() {
		let t = PatchinArray()
//		let input = [1,5,10]
//		let target = 20 // output --> 2 (modified input -- 1,2,4,5, 10)
		
		let input = [2,4,14,18,20,25,25,35,73,94]
		let target = 42
		
		
		let r = t.minPatches(input, target)
		print(r)
		
	}
	
	// the range must be belong to [1, n]
	// the input nums are sorted in nature
	func minPatches(_ nums: [Int], _ n: Int) -> Int {
			
		// we will keep tracking the revised input
		var inputs: [Int] = []
		
		// keep track of the result limit -- use a tuple here
		var range: (Int, Int) = (0, 0) // lower limit and upper limit
		
		var i = 0 // it indicates the index of nums
		let N = nums.count
		
		while range.1 < n { // stop the process when we reach to upper limit to n or more
			
			var num: Int?
			if i < N {
				// there is an element to process
				num = nums[i]
			}
			
			if let num = num, num <= (range.1 + 1) {
				// num exists and it is below upper range, we can add it. increment the index.
				// lets say upper range is 4 and next input we got 5, we should add that number.
				
				i += 1
				
			} else {
				
				// there is no element to process, we can pick next element of range upper limit.
				// OR the element is more than current upper range, we should not pick it for next process.
				
				num = range.1 + 1
				
			}
			
			// insert the num into input
			inputs.append(num!)
			range.1 += num!
		}
		
		// compare between inputs and nums count and check the diff and return the result
		return inputs.count - (i >= N ? N : i)
	}
	
	
}
