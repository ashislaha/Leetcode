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
	
	// BruteForce approach
	
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
	
	
	func threeSum2(_ nums: [Int]) -> [[Int]] {
		
		// 1. sort the array
		
		// 2. fix the first element and try to find out two other element in the sorted array
		
		// 3. use two pointer technique to move from front and back until you get value
		
		guard !nums.isEmpty, nums.count > 2 else { return [] }
		
		var results: [[Int]] = []
		
		let sorted = nums.sorted()
		
		for i in 0...sorted.count-2 {
			
			let value = sorted[i]
			var left = i+1
			var right = sorted.count-1
			
			while left < right {
				
				let sum = sorted[left] + sorted[right]
				if sum + value == 0 {
					results.append([value, sorted[left], sorted[right]])
					left += 1
					right -= 1
					
				} else {
					if sum + value > 0 { // positive
						right -= 1
					} else { // negative
						left += 1
					}
				}
				
			}
		}
		
		// remove duplicate answers
		guard !results.isEmpty else { return [] }
		var set = Set<[Int]>()
		var finalResult: [[Int]] = []
		for i in 0...results.count-1 {
			let element = results[i]
			if !set.contains(element) {
				set.insert(element)
				finalResult.append(element)
			}
		}
		
		return finalResult
	}
	
}





