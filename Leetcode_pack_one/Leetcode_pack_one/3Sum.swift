//
//  3Sum.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 12/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

/// 3Sum problem:

class Solution {
	func threeSum(_ nums: [Int]) -> [[Int]] {
		
		// 1. loop through 0 to n-1 ( say loop i)
 
		// 2. loop thorugh i+1 to n-1 (say loop j)
		
		// 3. create a set from j+1 to n-1
		
		// 4. check whether set contains -(nums[i] + nums[j]) so that overall sum is 0
		
		guard !nums.isEmpty && nums.count > 1 else { return [] }
		

		// Question - what if it has 2 elements and sum is 0
		
		var results: [[Int]] = []
		
		for i in 0...nums.count-2 {
			
			for j in i+1...nums.count-1 {
				
				var set: Set<Int> = []
				// construct a set from j+1 to n-1
				if j+1 < nums.count {
					
					for k in j+1...nums.count-1 {
						if !set.contains(nums[k]) {
							set.insert(nums[k])
						}
					}
					 
				} else {
					if nums[i] + nums[j] == 0 {
						results.append([nums[i], nums[j]]);
					}
				}
				
				// check the value
				let sum = nums[i] + nums[j]
				if set.contains(-sum) {
					results.append([nums[i], nums[j], -sum])
				}
				
				
			} // end of j
			
		} // end of i
		
		return results
	}
}





