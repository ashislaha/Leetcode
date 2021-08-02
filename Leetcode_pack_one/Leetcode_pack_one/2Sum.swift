//
//  2Sum.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 02/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class TwoSumProblem {
	
	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		
		guard !nums.isEmpty else { return [] }
		
		// edge case
		if nums.count == 1 {
			if target == nums[0] {
				return [0]
			} else {
				return []
			}
		}
		
		var dict: [Int: Int] = [:] // num, index
		
		for i in 0...nums.count-1 {
			
			let remaining = target - nums[i]
			if let index = dict[remaining] {
				return [index, i]
			} else {
				// insert
				dict[nums[i]] = i
			}
		}
		
		return [] // no result
	}
}
