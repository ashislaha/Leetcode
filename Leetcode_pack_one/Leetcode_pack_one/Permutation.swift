//
//  Permutation.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 08/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class Permutation {
	
	static func test() {
		
		let nums = [1,2,3]
		let permutation = Permutation()
		let results = permutation.permute(nums)
		print(results)
	}
	
	func permute(_ nums: [Int]) -> [[Int]] {
		
		// base-case when there is a single item and we can return it
		guard !nums.isEmpty else { return [] }
		
		if nums.count == 1  { return [nums] }
		
		var results: [[Int]] = []
		var localNums = nums
		permuteUtils(&localNums, low: 0, results: &results)
		
		return results
		
	}
	
	func permuteUtils(_ nums: inout [Int], low: Int, results: inout [[Int]]) {
		
		if low == nums.count-1 {
			// reach to end of that combination
			results.append(nums)
		} else {
			
			// iteration from low to end of nums array r
			for i in low...nums.count-1 {
				nums.swapAt(low, i)
				
				permuteUtils(&nums, low: low+1, results: &results)
				
				// convert it into original number
				nums.swapAt(low, i)
				
			}
			
		}
		
	}
	
}
